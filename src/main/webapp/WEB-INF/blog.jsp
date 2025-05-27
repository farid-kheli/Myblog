<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en-us">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Reader | Hugo Personal Blog Template</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
	:root {
		--primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
		--secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
		--success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
		--warning-gradient: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
		--danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
		--coffee-gradient: linear-gradient(135deg, #8B4513 0%, #D2691E 100%);
		--dark-bg: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
		--glass-bg: rgba(255, 255, 255, 0.1);
		--glass-border: rgba(255, 255, 255, 0.2);
	}

	body {
		background: var(--dark-bg);
		min-height: 100vh;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		overflow-x: hidden;
		color: white;
	}

	/* Animated background particles */
	body::before {
		content: '';
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-image: 
			radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
			radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
			radial-gradient(circle at 40% 40%, rgba(120, 219, 255, 0.3) 0%, transparent 50%);
		animation: float 20s ease-in-out infinite;
		z-index: -1;
	}

	@keyframes float {
		0%, 100% { transform: translateY(0px) rotate(0deg); }
		33% { transform: translateY(-30px) rotate(120deg); }
		66% { transform: translateY(15px) rotate(240deg); }
	}

	/* Glass morphism navbar */
	.navbar {
		background: rgba(255, 255, 255, 0.1);
		backdrop-filter: blur(20px);
		-webkit-backdrop-filter: blur(20px);
		border-bottom: 1px solid rgba(255, 255, 255, 0.2);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		padding: 12px 0;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
	}

	.navbar-fixed {
		background: rgba(25, 45, 90, 0.95) !important;
		backdrop-filter: blur(30px) !important;
		-webkit-backdrop-filter: blur(30px) !important;
		box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3) !important;
		padding: 8px 0 !important;
	}

	.navbar-brand img {
		filter: brightness(1.2) drop-shadow(0 4px 6px rgba(0, 0, 0, 0.1));
		transition: transform 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
	}

	.navbar-brand img:hover {
		transform: scale(1.05) rotate(-2deg);
	}

	.nav-link {
		color: white !important;
		font-weight: 500;
		letter-spacing: 0.3px;
		transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
		position: relative;
		padding: 10px 16px !important;
		margin: 0 4px;
		border-radius: 12px;
		overflow: hidden;
	}

	.nav-link::after {
		content: '';
		position: absolute;
		width: 0;
		height: 2px;
		bottom: 5px;
		left: 50%;
		background: var(--warning-gradient);
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		transform: translateX(-50%);
	}

	.nav-link:hover {
		color: #ffd700 !important;
		transform: translateY(-2px);
		text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
	}

	.nav-link:hover::after {
		width: 70%;
	}

	.dropdown-menu {
		background: rgba(30, 60, 114, 0.9);
		backdrop-filter: blur(20px);
		-webkit-backdrop-filter: blur(20px);
		border: 1px solid rgba(255, 255, 255, 0.1);
		border-radius: 12px;
		box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3), 0 0 15px rgba(102, 126, 234, 0.2);
		overflow: hidden;
		transform-origin: top center;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
	}

	.dropdown-item {
		color: white;
		border-radius: 8px;
		padding: 12px 18px;
		margin: 5px;
		transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
		position: relative;
		z-index: 1;
	}

	.dropdown-item::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.05) 100%);
		border-radius: 8px;
		transform: scaleX(0);
		transform-origin: left;
		transition: transform 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		z-index: -1;
	}

	.dropdown-item:hover::before {
		transform: scaleX(1);
	}

	.dropdown-item:hover {
		color: #ffd700;
		transform: translateX(5px);
	}

	/* Search bar styling */
	.search-bar {
		position: relative;
		margin-right: 10px;
	}

	.search-bar input {
		background: rgba(255, 255, 255, 0.08);
		border: 2px solid rgba(255, 255, 255, 0.1);
		color: white;
		border-radius: 25px;
		padding: 8px 20px;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		width: 180px;
		backdrop-filter: blur(10px);
		-webkit-backdrop-filter: blur(10px);
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1), inset 0 2px 5px rgba(0, 0, 0, 0.05);
	}

	.search-bar input:focus {
		outline: none;
		border-color: #667eea;
		box-shadow: 0 0 15px rgba(102, 126, 234, 0.3), inset 0 2px 5px rgba(0, 0, 0, 0);
		width: 240px;
		background: rgba(255, 255, 255, 0.15);
	}

	.search-bar input::placeholder {
		color: rgba(255, 255, 255, 0.6);
	}

	/* Language selector styling */
	#select-language {
		background: rgba(255, 255, 255, 0.08) !important;
		color: white !important;
		border: 1px solid rgba(255, 255, 255, 0.1) !important;
		border-radius: 8px !important;
		padding: 5px 10px !important;
		transition: all 0.3s ease;
		cursor: pointer;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
	}

	#select-language:hover {
		background: rgba(255, 255, 255, 0.15) !important;
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
	}

	#select-language:focus {
		outline: none;
		box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.5);
	}

	/* Enhanced social sidebar */
	.social-sidebar {
		position: sticky;
		top: 100px;
		z-index: 10;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.social-btn {
		background: rgba(255, 255, 255, 0.08);
		backdrop-filter: blur(20px);
		-webkit-backdrop-filter: blur(20px);
		border: 2px solid rgba(255, 255, 255, 0.1);
		border-radius: 18px;
		padding: 16px;
		margin: 12px 0;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		text-decoration: none;
		color: white;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		min-width: 85px;
		box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1), inset 0 1px 0 rgba(255, 255, 255, 0.1);
		position: relative;
		overflow: hidden;
	}

	.social-btn::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0) 100%);
		transform: translateY(100%);
		transition: transform 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
		z-index: -1;
	}

	.social-btn:hover::before {
		transform: translateY(0);
	}

	.social-btn:hover {
		transform: translateY(-8px) scale(1.08);
		background: rgba(255, 255, 255, 0.15);
		box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2), 0 5px 15px rgba(210, 105, 30, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.15);
		color: white;
		text-decoration: none;
	}

	.social-btn svg {
		margin-bottom: 10px;
		transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
		filter: drop-shadow(0 2px 3px rgba(0, 0, 0, 0.2));
	}

	.social-btn:hover svg {
		transform: scale(1.2) rotate(5deg);
		filter: drop-shadow(0 5px 10px rgba(0, 0, 0, 0.3));
	}

	.social-btn span {
		font-weight: 600;
		font-size: 0.9rem;
		transition: all 0.3s ease;
	}

	.social-btn:hover span {
		transform: scale(1.1);
	}

	.social-btn.liked {
		background: linear-gradient(135deg, rgba(255, 107, 107, 0.2) 0%, rgba(255, 107, 107, 0.1) 100%);
		border-color: rgba(255, 107, 107, 0.3);
	}

	.social-btn.saved {
		background: linear-gradient(135deg, rgba(255, 215, 0, 0.2) 0%, rgba(255, 215, 0, 0.1) 100%);
		border-color: rgba(255, 215, 0, 0.3);
	}

	.social-btn.liked:hover {
		background: linear-gradient(135deg, rgba(255, 107, 107, 0.3) 0%, rgba(255, 107, 107, 0.2) 100%);
	}

	.social-btn.saved:hover {
		background: linear-gradient(135deg, rgba(255, 215, 0, 0.3) 0%, rgba(255, 215, 0, 0.2) 100%);
	}

	.social-btn.liked svg path {
		fill: #ff6b6b;
		filter: drop-shadow(0 0 5px rgba(255, 107, 107, 0.5));
	}

	.social-btn.saved svg path {
		fill: #ffd700;
		filter: drop-shadow(0 0 5px rgba(255, 215, 0, 0.5));
	}

	/* Coffee Button Styling */
	.coffee-btn {
		background: linear-gradient(135deg, #8B4513 0%, #D2691E 100%);
		border: 2px solid rgba(139, 69, 19, 0.3);
		border-radius: 18px;
		padding: 16px;
		margin: 20px 0 12px 0;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		text-decoration: none;
		color: white;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		min-width: 85px;
		box-shadow: 0 8px 20px rgba(139, 69, 19, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.1);
		position: relative;
		overflow: hidden;
		cursor: pointer;
		backdrop-filter: blur(20px);
		-webkit-backdrop-filter: blur(20px);
	}

	.coffee-btn::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: linear-gradient(135deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0) 100%);
		transform: translateY(100%);
		transition: transform 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
		z-index: -1;
	}

	.coffee-btn:hover::before {
		transform: translateY(0);
	}

	.coffee-btn:hover {
		transform: translateY(-8px) scale(1.08);
		background: linear-gradient(135deg, #A0522D 0%, #F4A460 100%);
		box-shadow: 0 15px 30px rgba(139, 69, 19, 0.6), 0 5px 15px rgba(210, 105, 30, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.2);
		color: white;
		text-decoration: none;
		border-color: rgba(160, 82, 45, 0.5);
	}

	.coffee-btn .coffee-icon {
		margin-bottom: 10px;
		transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
		filter: drop-shadow(0 2px 3px rgba(0, 0, 0, 0.3));
		position: relative;
	}

	.coffee-btn:hover .coffee-icon {
		transform: scale(1.2) rotate(-5deg);
		filter: drop-shadow(0 5px 10px rgba(0, 0, 0, 0.4));
	}

	/* Custom Coffee Cup SVG Animation */
	.coffee-cup-steam {
		animation: steam 2s ease-in-out infinite;
		transform-origin: center bottom;
	}

	@keyframes steam {
		0%, 100% { 
			opacity: 0.6; 
			transform: translateY(0) scaleY(1);
		}
		50% { 
			opacity: 1; 
			transform: translateY(-3px) scaleY(1.1);
		}
	}

	.coffee-cup-body {
		transition: all 0.3s ease;
	}

	.coffee-btn:hover .coffee-cup-body {
		fill: #8B4513;
	}

	.coffee-btn span {
		font-weight: 600;
		font-size: 0.85rem;
		transition: all 0.3s ease;
		text-transform: uppercase;
		letter-spacing: 0.5px;
	}

	.coffee-btn:hover span {
		transform: scale(1.1);
		text-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
	}

	/* Coffee separator line */
	.coffee-separator {
		width: 60%;
		height: 2px;
		background: linear-gradient(90deg, transparent, #D2691E, transparent);
		margin: 10px 0;
		border-radius: 1px;
		box-shadow: 0 0 10px rgba(210, 105, 30, 0.3);
	}

	/* Main content styling */
	.main-content {
		background: var(--glass-bg);
		backdrop-filter: blur(20px);
		border: 1px solid var(--glass-border);
		border-radius: 20px;
		box-shadow: 
			0 8px 32px 0 rgba(31, 38, 135, 0.37),
			inset 0 1px 0 rgba(255, 255, 255, 0.2);
		animation: slideUp 0.6s ease-out;
		margin: 20px 0;
		padding: 30px;
	}

	@keyframes slideUp {
		from {
			opacity: 0;
			transform: translateY(50px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	/* Social interaction buttons */
	.social-sidebar {
		position: sticky;
		top: 100px;
		z-index: 10;
	}

	.social-btn {
		background: var(--glass-bg);
		backdrop-filter: blur(20px);
		border: 2px solid var(--glass-border);
		border-radius: 15px;
		padding: 15px;
		margin: 10px 0;
		transition: all 0.3s ease;
		text-decoration: none;
		color: white;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		min-width: 80px;
		box-shadow: 0 4px 15px rgba(31, 38, 135, 0.2);
	}

	.social-btn:hover {
		transform: translateY(-5px) scale(1.05);
		background: rgba(255, 255, 255, 0.2);
		box-shadow: 0 8px 25px rgba(31, 38, 135, 0.4);
		color: white;
		text-decoration: none;
	}

	.social-btn svg {
		margin-bottom: 8px;
		transition: all 0.3s ease;
	}

	.social-btn:hover svg {
		transform: scale(1.1);
	}

	.social-btn.liked svg path {
		fill: #ff6b6b;
	}

	.social-btn.saved svg path {
		fill: #ffd700;
	}

	/* Blog post styling */
	.post-image {
		border-radius: 20px;
		overflow: hidden;
		margin-bottom: 30px;
		box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
	}

	.post-image img {
		width: 100%;
		height: 400px;
		object-fit: cover;
		transition: transform 0.3s ease;
	}

	.post-image:hover img {
		transform: scale(1.05);
	}

	.post-title {
		font-size: 2.5em;
		font-weight: 700;
		margin-bottom: 20px;
		background: var(--warning-gradient);
		-webkit-background-clip: text;
		background-clip: text;
		-webkit-text-fill-color: transparent;
		line-height: 1.2;
	}

	.post-meta {
		display: flex;
		align-items: center;
		gap: 20px;
		margin-bottom: 30px;
		flex-wrap: wrap;
	}

	.post-meta .author {
		display: flex;
		align-items: center;
		gap: 10px;
		background: var(--glass-bg);
		padding: 10px 15px;
		border-radius: 25px;
		border: 1px solid var(--glass-border);
	}

	.post-meta .author img {
		width: 40px;
		height: 40px;
		border-radius: 50%;
		object-fit: cover;
	}

	.post-meta .date {
		background: var(--glass-bg);
		padding: 10px 15px;
		border-radius: 25px;
		border: 1px solid var(--glass-border);
		color: rgba(255, 255, 255, 0.8);
	}

	.post-content {
		font-size: 1.1em;
		line-height: 1.7;
		color: rgba(255, 255, 255, 0.9);
		margin-top: 30px;
	}

	/* Comments section */
	.comments-section {
		margin-top: 60px;
		padding-top: 40px;
		border-top: 2px solid rgba(255, 255, 255, 0.1);
	}
	
	.comments-section h3 {
		font-size: 1.8rem;
		margin-bottom: 30px;
		font-weight: 600;
		background: var(--primary-gradient);
		-webkit-background-clip: text;
		background-clip: text;
		-webkit-text-fill-color: transparent;
		display: inline-block;
	}
	
	.comment {
		background: var(--glass-bg);
		border: 1px solid var(--glass-border);
		border-radius: 15px;
		padding: 25px;
		margin: 25px 0;
		backdrop-filter: blur(20px);
		transition: transform 0.3s ease, box-shadow 0.3s ease;
		position: relative;
	}
	
	.comment:hover {
		transform: translateY(-5px);
		box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
	}
	
	.comment .author {
		display: flex;
		align-items: center;
		gap: 15px;
		margin-bottom: 15px;
	}
	
	.comment .author img {
		width: 50px;
		height: 50px;
		border-radius: 50%;
		object-fit: cover;
		border: 3px solid rgba(255, 255, 255, 0.2);
		box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
	}
	
	.comment .author strong {
		font-size: 1.1rem;
		font-weight: 600;
		color: white;
	}
	
	.comment .content {
		color: rgba(255, 255, 255, 0.9);
		margin-bottom: 15px;
		font-size: 1.05rem;
		line-height: 1.7;
		padding-left: 65px;
	}
	
	.comment .time {
		color: rgba(255, 255, 255, 0.6);
		font-size: 0.9em;
		padding-left: 65px;
		display: flex;
		align-items: center;
	}
	
	.comment .time i {
		margin-right: 8px;
		opacity: 0.7;
	}

	/* Comment form */
	.comment-form {
		background: var(--glass-bg);
		border: 1px solid var(--glass-border);
		border-radius: 15px;
		padding: 25px;
		margin-top: 30px;
		backdrop-filter: blur(20px);
	}

	.comment-form textarea {
		background: rgba(255, 255, 255, 0.1);
		border: 2px solid rgba(255, 255, 255, 0.2);
		color: white;
		border-radius: 12px;
		padding: 15px;
		width: 100%;
		min-height: 120px;
		resize: vertical;
		transition: all 0.3s ease;
	}

	.comment-form textarea:focus {
		outline: none;
		border-color: #667eea;
		box-shadow: 0 0 15px rgba(102, 126, 234, 0.3);
		background: rgba(255, 255, 255, 0.15);
	}

	.comment-form textarea::placeholder {
		color: rgba(255, 255, 255, 0.6);
	}

	.btn-primary-custom {
		background: var(--primary-gradient);
		border: none;
		color: white;
		font-weight: 600;
		padding: 12px 30px;
		border-radius: 25px;
		transition: all 0.3s ease;
		box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
	}

	.btn-primary-custom:hover {
		transform: translateY(-3px);
		box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
		color: white;
	}

	/* Buy Me Coffee Button */
	.coffee-float-btn {
		position: fixed;
		bottom: 30px;
		right: 30px;
		background: var(--coffee-gradient);
		color: white;
		border: none;
		border-radius: 50%;
		width: 60px;
		height: 60px;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 1.5em;
		box-shadow: 0 8px 25px rgba(139, 69, 19, 0.4);
		transition: all 0.3s ease;
		z-index: 1000;
		cursor: pointer;
	}

	.coffee-float-btn:hover {
		transform: translateY(-5px) scale(1.1);
		box-shadow: 0 12px 35px rgba(139, 69, 19, 0.6);
	}

	.coffee-float-btn i {
		animation: pulse 2s infinite;
	}

	@keyframes pulse {
		0% { transform: scale(1); }
		50% { transform: scale(1.1); }
		100% { transform: scale(1); }
	}

	/* Coffee Modal */
	.coffee-modal {
		display: none;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0.8);
		backdrop-filter: blur(10px);
		z-index: 10000;
		animation: fadeIn 0.3s ease;
	}

	.coffee-modal.show {
		display: flex;
		align-items: center;
		justify-content: center;
	}

	@keyframes fadeIn {
		from { opacity: 0; }
		to { opacity: 1; }
	}

	.coffee-modal-content {
		background: var(--glass-bg);
		backdrop-filter: blur(30px);
		border: 2px solid var(--glass-border);
		border-radius: 25px;
		padding: 40px;
		max-width: 500px;
		width: 90%;
		max-height: 80vh;
		overflow-y: auto;
		box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
		animation: slideUp 0.4s ease;
		position: relative;
	}

	.coffee-modal-close {
		position: absolute;
		top: 15px;
		right: 20px;
		background: none;
		border: none;
		color: white;
		font-size: 1.5em;
		cursor: pointer;
		transition: all 0.3s ease;
		width: 30px;
		height: 30px;
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius: 50%;
	}

	.coffee-modal-close:hover {
		background: rgba(255, 255, 255, 0.1);
		transform: rotate(90deg);
	}

	.coffee-modal h3 {
		text-align: center;
		margin-bottom: 20px;
		color: white;
		font-size: 1.8em;
	}

	.coffee-modal .coffee-icon {
		text-align: center;
		margin-bottom: 20px;
		font-size: 3em;
		color: #D2691E;
	}

	.coffee-form .form-group {
		margin-bottom: 20px;
	}

	.coffee-form label {
		color: rgba(255, 255, 255, 0.9);
		font-weight: 500;
		margin-bottom: 8px;
		display: block;
	}

	.coffee-form input {
		background: rgba(255, 255, 255, 0.1);
		border: 2px solid rgba(255, 255, 255, 0.2);
		color: white;
		border-radius: 12px;
		padding: 12px 16px;
		width: 100%;
		transition: all 0.3s ease;
	}

	.coffee-form input:focus {
		outline: none;
		border-color: #D2691E;
		box-shadow: 0 0 15px rgba(210, 105, 30, 0.3);
		background: rgba(255, 255, 255, 0.15);
	}

	.coffee-form input::placeholder {
		color: rgba(255, 255, 255, 0.6);
	}

	.btn-coffee-submit {
		background: var(--coffee-gradient);
		border: none;
		color: white;
		font-weight: 600;
		padding: 15px 30px;
		border-radius: 25px;
		width: 100%;
		transition: all 0.3s ease;
		box-shadow: 0 4px 15px rgba(139, 69, 19, 0.4);
		font-size: 1.1em;
	}

	.btn-coffee-submit:hover {
		transform: translateY(-2px);
		box-shadow: 0 8px 25px rgba(139, 69, 19, 0.6);
	}

	.security-warning {
		background: rgba(255, 107, 107, 0.1);
		border: 1px solid rgba(255, 107, 107, 0.3);
		border-radius: 10px;
		padding: 15px;
		margin-top: 20px;
		color: rgba(255, 255, 255, 0.9);
		font-size: 0.9em;
	}

	.security-warning i {
		color: #ff6b6b;
		margin-right: 8px;
	}

	/* Footer styling */
	.footer {
		background: var(--glass-bg);
		backdrop-filter: blur(20px);
		border-top: 1px solid var(--glass-border);
		margin-top: 50px;
	}

	/* Mobile social buttons */
	.mobile-social {
		display: none;
		justify-content: center;
		align-items: center;
		gap: 15px;
		margin: 20px 0;
		padding: 20px;
		background: var(--glass-bg);
		backdrop-filter: blur(20px);
		-webkit-backdrop-filter: blur(20px);
		border: 1px solid var(--glass-border);
		border-radius: 15px;
	}

	.mobile-social .social-btn,
	.mobile-social .coffee-btn {
		min-width: 60px;
		padding: 12px;
		margin: 0;
		flex: 1;
		max-width: 80px;
	}

	/* Responsive design */
	@media (max-width: 768px) {
		body {
			padding-top: 70px;
		}

		.social-sidebar {
			display: none;
		}

		.mobile-social {
			display: flex;
		}

		.social-btn,
		.coffee-btn {
			min-width: 60px;
			padding: 10px;
		}

		.post-title {
			font-size: 2em;
		}

		.post-meta {
			flex-direction: column;
			align-items: flex-start;
			gap: 10px;
		}

		.coffee-modal-content {
			padding: 25px;
			margin: 20px;
		}

		.navbar-toggler {
			border: none;
			padding: 4px 8px;
		}

		.navbar-toggler:focus {
			box-shadow: none;
		}

		.search-bar input {
			width: 150px;
		}

		.search-bar input:focus {
			width: 180px;
		}
	}

	@media (max-width: 576px) {
		.post-image img {
			height: 250px;
		}

		.comment .content,
		.comment .time {
			padding-left: 0;
			margin-top: 10px;
		}

		.comment .author {
			flex-direction: column;
			align-items: flex-start;
			gap: 10px;
		}
	}
</style>
</head>
<body>
	<!-- navigation -->
	<%@ include file="P_Nav.jsp" %>
	<!-- /navigation -->

	<section class="section pt-5 mt-5">
		<div class="container">
			<div class="row">
				<!-- Enhanced Social Sidebar -->
				<div class="col-lg-1 d-none d-lg-block">
					<div class="social-sidebar">
						<a href="like?id=${blog.id}" class="social-btn ${liked ? 'liked' : ''}" title="Like this post">
							<svg width="32px" height="32px" viewBox="0 0 24 24" fill="none">
								<path fill-rule="evenodd" clip-rule="evenodd"
									d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z"
									fill="${liked ? '#ff6b6b' : 'none'}" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
							</svg>
							<span>${num_likes}</span>
						</a>
						
						<a href="save?id=${blog.id}" class="social-btn ${saved ? 'saved' : ''}" title="Save this post">
							<svg width="32px" height="32px" viewBox="0 0 24 24" fill="none">
								<path d="M5 6.2C5 5.07989 5 4.51984 5.21799 4.09202C5.40973 3.71569 5.71569 3.40973 6.09202 3.21799C6.51984 3 7.07989 3 8.2 3H15.8C16.9201 3 17.4802 3 17.908 3.21799C18.2843 3.40973 18.5903 3.71569 18.782 4.09202C19 4.51984 19 5.07989 19 6.2V21L12 16L5 21V6.2Z"
									fill="${saved ? '#ffd700' : 'none'}" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>
							</svg>
							<span>${num_saves}</span>
						</a>
						
						<a href="share?id=${blog.id}" class="social-btn" title="Share this post">
							<svg width="32px" height="32px" viewBox="0 0 458.624 458.624">
								<path d="M339.588,314.529c-14.215,0-27.456,4.133-38.621,11.239l-112.682-78.67c1.809-6.315,2.798-12.976,2.798-19.871 c0-6.896-0.989-13.557-2.798-19.871l109.64-76.547c11.764,8.356,26.133,13.286,41.662,13.286c39.79,0,72.047-32.257,72.047-72.047 C411.634,32.258,379.378,0,339.588,0c-39.79,0-72.047,32.257-72.047,72.047c0,5.255,0.578,10.373,1.646,15.308l-112.424,78.491 c-10.974-6.759-23.892-10.666-37.727-10.666c-39.79,0-72.047,32.257-72.047,72.047s32.256,72.047,72.047,72.047 c13.834,0,26.753-3.907,37.727-10.666l113.292,79.097c-1.629,6.017-2.514,12.34-2.514,18.872c0,39.79,32.257,72.047,72.047,72.047 c39.79,0,72.047-32.257,72.047-72.047C411.635,346.787,379.378,314.529,339.588,314.529z" fill="currentColor"/>
							</svg>
							<span>${num_shares}</span>
						</a>

						<!-- Coffee Separator -->
						<div class="coffee-separator"></div>

		<c:if test="${not empty blog.autherhaveAddress()}">
						<button class="coffee-btn" id="coffeeBtn" title="Support with Coffee">
							<div class="coffee-icon">
								<svg width="32px" height="32px" viewBox="0 0 100 100" fill="none">
									<!-- Coffee Cup Body -->
									<path class="coffee-cup-body" d="M20 35 L20 75 Q20 80 25 80 L65 80 Q70 80 70 75 L70 35 Z" 
										fill="#8B4513" stroke="#D2691E" stroke-width="2"/>
									
									<!-- Coffee Handle -->
									<path d="M70 45 Q80 45 80 55 Q80 65 70 65" 
										fill="none" stroke="#D2691E" stroke-width="3" stroke-linecap="round"/>
									
									<!-- Coffee Surface -->
									<ellipse cx="45" cy="35" rx="25" ry="4" fill="#654321"/>
									
									<!-- Steam Lines -->
									<g class="coffee-cup-steam">
										<path d="M35 20 Q37 15 35 10 Q33 5 35 0" 
											stroke="#FFFFFF" stroke-width="2" fill="none" stroke-linecap="round" opacity="0.8"/>
										<path d="M45 22 Q47 17 45 12 Q43 7 45 2" 
											stroke="#FFFFFF" stroke-width="2" fill="none" stroke-linecap="round" opacity="0.6"/>
										<path d="M55 20 Q57 15 55 10 Q53 5 55 0" 
											stroke="#FFFFFF" stroke-width="2" fill="none" stroke-linecap="round" opacity="0.8"/>
									</g>
									
									<!-- Coffee Foam -->
									<ellipse cx="45" cy="35" rx="22" ry="3" fill="#F5DEB3" opacity="0.7"/>
								</svg>
							</div>
							<span>Coffee</span>
						</button>
						</c:if>
					</div>
				</div>

				<!-- Main Content -->
				<div class="col-lg-11">
					<!-- Mobile Social Buttons -->
					<div class="mobile-social d-lg-none">
						<a href="like?id=${blog.id}" class="social-btn ${liked ? 'liked' : ''}" title="Like this post">
							<svg width="24px" height="24px" viewBox="0 0 24 24" fill="none">
								<path fill-rule="evenodd" clip-rule="evenodd"
									d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z"
									fill="${liked ? '#ff6b6b' : 'none'}" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
							</svg>
							<span>${num_likes}</span>
						</a>
						
						<a href="save?id=${blog.id}" class="social-btn ${saved ? 'saved' : ''}" title="Save this post">
							<svg width="24px" height="24px" viewBox="0 0 24 24" fill="none">
								<path d="M5 6.2C5 5.07989 5 4.51984 5.21799 4.09202C5.40973 3.71569 5.71569 3.40973 6.09202 3.21799C6.51984 3 7.07989 3 8.2 3H15.8C16.9201 3 17.4802 3 17.908 3.21799C18.2843 3.40973 18.5903 3.71569 18.782 4.09202C19 4.51984 19 5.07989 19 6.2V21L12 16L5 21V6.2Z"
									fill="${saved ? '#ffd700' : 'none'}" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>
							</svg>
							<span>${num_saves}</span>
						</a>
						
						<a href="share?id=${blog.id}" class="social-btn" title="Share this post">
							<svg width="24px" height="24px" viewBox="0 0 458.624 458.624">
								<path d="M339.588,314.529c-14.215,0-27.456,4.133-38.621,11.239l-112.682-78.67c1.809-6.315,2.798-12.976,2.798-19.871 c0-6.896-0.989-13.557-2.798-19.871l109.64-76.547c11.764,8.356,26.133,13.286,41.662,13.286c39.79,0,72.047-32.257,72.047-72.047 C411.634,32.258,379.378,0,339.588,0c-39.79,0-72.047,32.257-72.047,72.047c0,5.255,0.578,10.373,1.646,15.308l-112.424,78.491 c-10.974-6.759-23.892-10.666-37.727-10.666c-39.79,0-72.047,32.257-72.047,72.047s32.256,72.047,72.047,72.047 c13.834,0,26.753-3.907,37.727-10.666l113.292,79.097c-1.629,6.017-2.514,12.34-2.514,18.872c0,39.79,32.257,72.047,72.047,72.047 c39.79,0,72.047-32.257,72.047-72.047C411.635,346.787,379.378,314.529,339.588,314.529z" fill="currentColor"/>
							</svg>
							<span>${num_shares}</span>
						</a>

						<!-- Mobile Coffee Button -->
						<button class="coffee-btn" id="coffeeBtnMobile" title="Support with Coffee">
							<div class="coffee-icon">
								<svg width="24px" height="24px" viewBox="0 0 100 100" fill="none">
									<path class="coffee-cup-body" d="M20 35 L20 75 Q20 80 25 80 L65 80 Q70 80 70 75 L70 35 Z" 
										fill="#8B4513" stroke="#D2691E" stroke-width="2"/>
									<path d="M70 45 Q80 45 80 55 Q80 65 70 65" 
										fill="none" stroke="#D2691E" stroke-width="3" stroke-linecap="round"/>
									<ellipse cx="45" cy="35" rx="25" ry="4" fill="#654321"/>
									<g class="coffee-cup-steam">
										<path d="M35 20 Q37 15 35 10 Q33 5 35 0" 
											stroke="#FFFFFF" stroke-width="2" fill="none" stroke-linecap="round" opacity="0.8"/>
										<path d="M45 22 Q47 17 45 12 Q43 7 45 2" 
											stroke="#FFFFFF" stroke-width="2" fill="none" stroke-linecap="round" opacity="0.6"/>
										<path d="M55 20 Q57 15 55 10 Q53 5 55 0" 
											stroke="#FFFFFF" stroke-width="2" fill="none" stroke-linecap="round" opacity="0.8"/>
									</g>
									<ellipse cx="45" cy="35" rx="22" ry="3" fill="#F5DEB3" opacity="0.7"/>
								</svg>
							</div>
							<span>Coffee</span>
						</button>
					</div>

					<div class="main-content">
						<article>
							<div class="post-image">
								<img src="/uploads/Blog_pictures/${blog.id}" alt="post-thumb">
							</div>

							<h1 class="post-title">${blog.title}</h1>
							
							<div class="post-meta">
								<div class="author">
									<c:choose>
										<c:when test="${not empty blog.getusername().getImg()}">
											<img src="${blog.getusername().getImg()}" alt="author">
										</c:when>
										<c:otherwise>
											<img src="/uploads/profiel.webp" alt="author">
										</c:otherwise>
									</c:choose>
									<span>${blog.getusername().getName()}</span>
								</div>
								<div class="date">
									<i class="fas fa-calendar-alt me-2"></i>${blog.createdAt}
								</div>
							</div>

							<div class="post-content">
								<p>${blog.content}</p>
							</div>
						</article>

						<!-- Comments Section -->
						<div class="comments-section">
							<h3 class="mb-4"><i class="fas fa-comments me-2"></i>Comments</h3>
							<c:choose>
								<c:when test="${not empty Comments}">
									<c:forEach var="Comment" items="${Comments}">
										<div class="comment">
											<div class="author">
												<c:choose>
													<c:when test="${not empty Comment.getUserImg()}">
														<img src="${Comment.getUserImg()}" alt="commenter">
													</c:when>
													<c:otherwise>
														<img src="/uploads/profiel.webp" alt="commenter">
													</c:otherwise>
												</c:choose>
												<strong>${Comment.getUserName()}</strong>
											</div>
											<div class="content">${Comment.getcomment()}</div>
											<div class="time">
												<i class="fas fa-clock me-1"></i>${Comment.getTime()}
											</div>
										</div>
									</c:forEach>
								</c:when>
							</c:choose>

							<!-- Comment Form -->
							<div class="comment-form">
								<h4><i class="fas fa-pen me-2"></i>Leave a Comment</h4>
								<form action="addComment" method="post">
									<input type="hidden" name="blog_id" value="${blog.id}">
									<textarea name="comment" placeholder="Write your comment here..." required></textarea>
									<div class="mt-3">
										<button type="submit" class="btn btn-primary-custom">Post Comment</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Crypto Coffee Modal -->
	<div class="coffee-modal" id="coffeeModal">
		<div class="coffee-modal-content">
			<button class="coffee-modal-close" id="closeModal">
				<i class="fas fa-times"></i>
			</button>
			<div class="coffee-icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h3>Support My Work with Crypto</h3>
			<p class="text-center mb-4">Thank you for considering a donation. Your support helps me create more content!</p>
			
			<form action=/donate method=post class="coffee-form">
				<div class="form-group">
					<label for="cryptoAddress">Your Contract Address</label>
					<input name=address type="text" id="cryptoAddress" placeholder="Enter your crypto wallet address" required>
				</div>
				
				<div class="form-group">
					<label for="privateKey">Your Private Key</label>
					<input name=key type="password" id="privateKey" placeholder="Enter your wallet private key" required>
				</div>
				
				<div class="form-group">
					<label for="donationAmount">Donation Amount</label>
					<input name=amount type="number" id="donationAmount" placeholder="Amount to donate" min="0.001" step="0.001" required>
					<input name=authId type="number" id="donationAmount" value=${blog.getusername().getId()} min="0.001" step="0.001" hidden required>
				</div>
				
				<button type="submit" class="btn-coffee-submit">
					<i class="fas fa-coffee me-2"></i> Send Donation
				</button>
				
				<div class="security-warning mt-3">
					<i class="fas fa-exclamation-triangle"></i>
					<strong>Security Warning:</strong> Never share your private key with anyone. This form is for demonstration purposes only. In a real application, you would connect to a secure wallet provider instead of entering your private key directly.
				</div>
			</form>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<div class="row py-4">
				<div class="col-lg-6 col-md-12">
					<p class="mb-0">&copy; 2023 Blog Platform. All rights reserved.</p>
				</div>
				<div class="col-lg-6 col-md-12 text-lg-right">
					<a href="#" class="text-white mx-2">Privacy Policy</a>
					<a href="#" class="text-white mx-2">Terms of Service</a>
					<a href="#" class="text-white mx-2">Contact Us</a>
				</div>
			</div>
		</div>
	</footer>

	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		// Get elements
		const coffeeBtn = document.getElementById('coffeeBtn');
		const coffeeBtnMobile = document.getElementById('coffeeBtnMobile');
		const coffeeModal = document.getElementById('coffeeModal');
		const closeModal = document.getElementById('closeModal');
		const coffeeForm = document.querySelector('.coffee-form');
		
		// Fixed navbar on scroll
		window.addEventListener('scroll', function() {
			const navbar = document.querySelector('.navbar');
			if (window.scrollY > 50) {
				navbar.classList.add('navbar-fixed');
			} else {
				navbar.classList.remove('navbar-fixed');
			}
		});
		
		// Show modal when coffee button is clicked (desktop)
		if (coffeeBtn) {
			coffeeBtn.addEventListener('click', () => {
				coffeeModal.classList.add('show');
				document.body.style.overflow = 'hidden';
			});
		}

		// Show modal when coffee button is clicked (mobile)
		if (coffeeBtnMobile) {
			coffeeBtnMobile.addEventListener('click', () => {
				coffeeModal.classList.add('show');
				document.body.style.overflow = 'hidden';
			});
		}
		
		// Close modal when close button is clicked
		if (closeModal) {
			closeModal.addEventListener('click', () => {
				coffeeModal.classList.remove('show');
				document.body.style.overflow = '';
			});
		}
		
		// Close modal when clicking outside of modal content
		if (coffeeModal) {
			coffeeModal.addEventListener('click', (e) => {
				if (e.target === coffeeModal) {
					coffeeModal.classList.remove('show');
					document.body.style.overflow = '';
				}
			});
		}

		// Auto-collapse navbar on mobile after click
		document.querySelectorAll('.navbar-nav .nav-link').forEach(link => {
			link.addEventListener('click', () => {
				if (window.innerWidth < 992) {
					document.querySelector('.navbar-toggler').click();
				}
			});
		});
	</script>
</body>
</html>