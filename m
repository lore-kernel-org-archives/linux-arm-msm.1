Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABAB3AC0F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307268; cv=none; b=eh74F5ht+hPlam4n9GzQShNjfslMERYFO7TkGzJA5DjGUn2u3HAWUcwm0yW9Kkx5H6t6qJVNOYTGjJ1hHdsUWnEKhL27m9IR7qbIqVihLQ0hbQ/dJB1HRsC7M7oPWjP4hy0SyFkQHcBMPRUBqxppEiliXVl9QuQcIgpcMJLRffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307268; c=relaxed/simple;
	bh=Dm4u4C0mB5op9qaZTgebzihhht99CMEurS1Nf+yKzBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CC8V9K8CryQmInVnJonRqdlnwT705LI2k1LQ0bpFHcMYN8Fei7BexN160ifCkvwOwjyxyskEiTexIrBrVo3ZT9rXXgIoufdQ71+EkihUtnBkNi0GldMrJJK+EblstRsvuRxOgvHhwA5i9fll40VFuNYGdEpw8iBhDK1D9GpvrT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9fjA4Nf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9fjA4Nf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso4582264a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784307267; x=1784912067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dUDqsx4fzu9ykyz4+5jViAQF0ipxfzs3eZMGfKTlNcI=;
        b=G9fjA4NfabI0rXZXEqxY/ZRAlCwz1sLfNBi1cEIjcl1AhHFyFmwkc+O0WE/olS/2dz
         rXf26PCDyOka9pfPYwm6XzVJAb/jbZDr3uXaooaq1SdzfV+LqELCxFnogyaqZOp7rni3
         JizL0SoMkU/uHiOGzXATAI2vxwI9QEifBdOUt2796a0o0nqDWarn2cRF5RVWFeba4Tl5
         oe4D0kODtXekMlp3FFKIkSE0j8Dbx/y1K/8Ax3y8GD+bS+BH8PaXcpgSczIuLdK3nnTJ
         6lUsbIKsoVnpTuXFPULEDjysFUqdDRfxYS3qrW4fCKMMqll92mO1MDePDfJN5BCdJhDx
         TvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307267; x=1784912067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUDqsx4fzu9ykyz4+5jViAQF0ipxfzs3eZMGfKTlNcI=;
        b=DGYiwo4bifxgFW1EUgQAatIn9lni26F9LpKgBeQZu+8gygJt5/jc2aKJbOynJRd4lb
         KiX/88neTrwoiVludW058c+rhJLPyq7MFbzfcj9OYdWyAPPtf2hsmZbLuyXyxwcDQLBc
         Lue5enz5Zae8tJi1TEA9Kba7MDDwhnknNXt41hCejGpnYUm/dUoDIRnOftEWz9DMeT3B
         0OYpFtrnI2RbcBkXNQhJuuaCVIbvbDXd6SPbLPo06XRi0a1nyblo/FWWHWk3fMGpBTL5
         BZ+q0D2k26Xjs5jy6GK0GFDG0wyAGz5T/qw0/wCUBVzrfzOjhMtJRRNDKk9zXYByQ5fj
         vbvg==
X-Forwarded-Encrypted: i=1; AHgh+RqXexWCQAM7evgXAMqiXESqNLai3VaaQQI2xcfeA2jDYGU7U8ec+px7HpEPtnzUtQijZ8Zam7WhNJIFcayO@vger.kernel.org
X-Gm-Message-State: AOJu0YztMIn4xK11xhFZKHsq8wGg0YSMkahgAI5DKcDkuhD+JxyO13SH
	14I2XK8gKwIYBLolog3MzpjNbqdsHZqfIy1PjWQz3MKY271G3F0GbNiY
X-Gm-Gg: AfdE7cls5dDo+EFNJGLi0utj96GNk3HfvLxESSDV7ksTOZWXra13ixjjn5+KjH7r/5N
	qqnfVCEfskG6FHGwkc4eR003tl3uB9vAZNfNaum8Sm/L0HsBYLB3+bNWa0VQgK4NybsLQwlEah7
	6Hkb8f4ZZM5Qxpfr1PhxDSKDsNoCHHv1El2yx3eAKNQHGhpGFe2yJaWlsW6XZmD+hDlh4c+b1bB
	xvR+B5cCrCV+qVZIJZ/1J0+CHjgvoDZW4g7NgvR+hsDh6zVy0wG44faieXs1QAdjqthurLivXfO
	oshWY77KGSJT24xvb2jIPOmXU2l3/QBRC84uI3QnWUWZKn6owyng8cRkNjMxw9vJhauKHk1MvgV
	esU/cxtJ8ErRK+pf2oHPiO9ldFAdahRpTsqBzyXjI/x22sXcEdpjUQx2h6QiOkST+mtZuJnYrRz
	+JdVOFE4MfJDNyCD7mBFvtnK/JyP8CpRCBuUlpZRQiFwg=
X-Received: by 2002:a17:90a:f950:b0:38d:a76:6470 with SMTP id 98e67ed59e1d1-38e4b5a8c70mr3205921a91.39.1784307266731;
        Fri, 17 Jul 2026 09:54:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7638:3cbc:f1c5:2eeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm9233723eec.0.2026.07.17.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:54:25 -0700 (PDT)
Date: Fri, 17 Jul 2026 09:54:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: input: focaltech,ft8112: Add
 focaltech,ft3d81 compatible
Message-ID: <alpeO7hgp3H9ydmt@google.com>
References: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-0-5dd091e25801@oss.qualcomm.com>
 <20260717-add_focaltech_ft3d81_touchscreen_support-v4-1-5dd091e25801@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-1-5dd091e25801@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 05:28:34PM +0530, Pradyot Kumar Nayak wrote:
> The Focaltech ft3d81 is fully compatible with the ft8112 i.e.
> it uses the same I2C-HID protocol and the same power-on/reset sequencing,
> DT nodes for boards carrying an ft3d81,can therefore bind to the existing
> ft8112 driver without any additional changes.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>

Applied, thank you.

-- 
Dmitry
