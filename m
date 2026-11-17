Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886900;
	b=2KoZ7X5JuypelC7gMniQCe0X3lz65mN4FDBBxf1AWNNuuhIHKs1IaTsz4+GF2pt5MFUt
	 zcRYrymsQPp0Zpl8etTBOECXqN0CclXS1aOY6RlaRWOr0ZphmPNBXLOCoKaWOxRTMheRy
	 mZu9S6iX+YaltUVL38T1qa73882pBm0aJxFpyTNgGcmjx03zYo1m7+pCXIJBuwBq5eNPk
	 KNRIFM4Ewg4O1idqC9bnfmMkFEy9ghy0KVhQ8lCtVmtLHjij9B5W2XChlBQ9CdBHehmPu
	 DgwmkFSOBEyQbbMr5h5GRPnlpZ8D9zSBfpkJ14hOkssR3M3CyJB5P4FQYH7qTlw/48Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k7CFaIYn1dfrHupuH6Y5CyqJe0ZNCdr90nwRUvOqNf4=;
	b=mFWZr7L4Bz8we5HZYgazlZgwW1sjvmbrzAKtk6v7Ku+KSdVlI+qtfWRpiVQ0YEmwtG4T
	 aB0bs/QB3osycLZ86eZpF7adP5SO7Mu7OHWpQSZPCvJHT0phl+8r2jFd9L+lN4YhHR5op
	 BTQENWvzvyKtMVNYpqqrFU+6fqCu9hLB4mJ8FYsvpX+V5b5qzkK7wsPADnlSiig+aCxJB
	 Hpx4A0fuTB8jQ1Aw1O8gBqIw7KytbK6rcsKzBBonxt7UiPKkLstwQRy/gwvhiQ8jtAM+v
	 hAR2XwFbCfQxD5b4GU6EVNeVyFJ1cC0UDMZRk+dF3h4MejbHURgw7FzJauEcKYvDnTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdEUwdiN;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE4F606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 03:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE4F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdEUwdiN
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53665358476so50167901cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 19:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794886899; x=1795491699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7CFaIYn1dfrHupuH6Y5CyqJe0ZNCdr90nwRUvOqNf4=;
        b=HdEUwdiNxYZc55yheChwckSLrfco9NqjfcKs/Ci6JbuAx2f/2IiIMMXGhQo8fsLQ4J
         fAgawNA9kAHn1oklTT9KiMF8gsiJz5SyWGvsRd/DvfdtlD9j1Es56l6drl2fVfkRDz9u
         zzS1SplmsLgtnQ5Jc3yQeygLgBC0FVXcIJIhe65iPqImpvlzuRrktaBgXhe1wgD/nGSq
         W2giXf1/ezAGz/ikKoPaAPh8ZJNEMgB503vNFYZTUSFwEv9JWyzXISI2yi2IGnsOV0wU
         jyBiSvb0i8pFkAso7mnccqncWUNgqiQeOtwZ3ejQxMKqlb+yWRmgfQN+uzOPdOOSoMnH
         K7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794886899; x=1795491699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7CFaIYn1dfrHupuH6Y5CyqJe0ZNCdr90nwRUvOqNf4=;
        b=ysGZu0LlPKKgKmRYlajHsUsfDYhABclSMcbpb8ONp2H2qySFfLmDjR/NCyzdyFm70A
         ON8RZF//8fE4ElwxDB0fHNIfmi+4gZhJTEgrKtb04YtBdH0u0Uc2YLXOwLSCred0jzuj
         glYMX4CmwclTanjVZcIACS9CiXoyu3/6cP92RGlzCetz+YAI/LxjqXCqqozkU7owvnZZ
         XtLqk/94SklkGSsuPI48mrFuM5suz8DEAHIvlmP/xQl0pitbY91DTS1Un6Lr507Kq8gj
         kOVgwQTjYJCjg9EL/ltGtf0474Y6cLI6xnAruqwcSuYFZdWzHGAvr7IqEI/yM+upXMWw
         LqYg==
X-Forwarded-Encrypted: i=1; AL+hErH2mUl/63RL3IZ1pYur9XevsbOOrU8G4b2/xwyedmXPum1HwGsHbazJhoi7eV5lBdPmYxgU+3QuXyY9ICsN@vger.kernel.org
X-Gm-Message-State: APuU4Z9k5n7kLoRr/eu9ZJwCmhWyYmGAFgwW00bsBB2j9pLoGcq6FoX6
	3TQMutP7YfSQQT0G69N8BRsUIcS8VfqbuUAn+lL3qW4I4MFZUlTNVVFO
X-Gm-Gg: AYBFou0g6EYg7X5t1qvfi38W0S6HHZ8U2diuFQSb7/fj3RVaxLqs7nZwy6vOaXQwjst
	l53u8ozvvroL3EGNbX23DERgdm14tkRenGPZtgIyM+DPssmCPhUjHtVv3pHSd/5JrNkOHZWfIBI
	5APG6xP5eokvPl+jqcMhftzsqmEFDUvNuZydPHw2StKVc17mB0yUHqhxKQti2USRnBlHHJB4m0+
	4d4YQ4lsZcOFVYiiINd7ekRgtqKjlhURRtAiavZSxUX1qVTas36YjAm9k3oeKHryhVBvkwOj7Cb
	NDrA3qPWpFJ1dOGv8T/P0VO/n4PMvduKAQle06jb9q0isOsK0zgphxNbx8DS9nXdu/iWhX350FJ
	k7394NE5+Jjp2ydYztJTmoepZ4qhoWP4Pj0uDFHXlKLAY1ZalLQ/IIiU59gPlejE7zOPpkwdEJS
	qGOsyijf4MpLr1/bbQOp+n9m/YgzIFb/OrEWwXZxWGnyp0FNIJza9skWescUjTnvDpnxYvw9IeS
	qi3pJK9bVNVqfY6Tm0fPpasYhGKUfLrKfxlbMnaatt4H5oK/4PSbUL3zTPvHZqLKQc6T41XP3vJ
	FV4VjrmEca6Y8nyzMzhDXIknW4vmpsuOIHeeqeg/ubrXsqMRXhJywQ61gXKlacel6tXmpZMwOCz
	Dn8WPUaj70myrk4Oy0vruQSPBXMkYaRMRiV5s1VgKCe/M2FlwIqkU
X-Received: by 2002:a05:620a:880e:b0:93f:6375:aaa0 with SMTP id af79cd13be357-9494bccfa89mr1896919885a.80.1794886899150;
        Mon, 16 Nov 2026 19:41:39 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm1003870985a.25.2026.11.16.19.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:41:38 -0800 (PST)
Message-ID: <5e8d0a68-5c88-4a31-9c9c-47966093a273@gmail.com>
Date: Mon, 16 Nov 2026 22:41:37 -0500
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel-edp: disable the backlight at probe
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Linus Walleij <linusw@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dale Whinham <daleyo@gmail.com>, linux-arm-msm@vger.kernel.org,
 aarch64-laptops@lists.linaro.org
References: <20261026-sp11-bl-upstream-1-v2-1-efc84396adf1@gmail.com>
 <CAD=FV=U2sZaobJMHCimqB5Kw0fZ_-7=9tHAxT-KrSP8uQiY-vw@mail.gmail.com>
 <49e9a6d2-8665-4e78-ac17-da5a55abf065@linaro.org>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <49e9a6d2-8665-4e78-ac17-da5a55abf065@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Neil,

On 11/2/26 8:15 AM, Neil Armstrong wrote:
> On 10/30/26 02:40, Doug Anderson wrote:
>> Hi,
>>
>> On Mon, Oct 26, 2026 at 6:14 PM Haipeng Lin via B4 Relay
>> <devnull+jimmie.lin.gmail.com@kernel.org> wrote:
>>>
>>> From: Haipeng Lin <jimmie.lin@gmail.com>
>>>
>>> pwm-backlight can preserve the enabled state left by firmware to
>>> support a seamless display handoff. However, panel-edp does not support
>>> such a handoff. When probing a generic eDP panel, it powers the panel
>>> on to read its EDID. If display pipeline binding takes longer than the
>>> runtime-PM autosuspend delay, the panel is then powered off while the
>>> backlight remains enabled.
> 
> So we don't support handoff _now_ but we may certainly support it someday.
[...]> 
> I lack some knowledge, but when the display pipeline is probed
> who's in charge of disabling the backlight when suspending ?

My understanding of the lifecycle is that once the display pipeline is
bound, and the first modeset is done, the DRM panel core via the panel
bridge is in charge of the backlight:

Enable:
panel_bridge_atomic_pre_enable() -> drm_panel_prepare() ->
 pm_runtime_get_sync() (panel power on)
panel_bridge_atomic_enable()     -> drm_panel_enable()  ->
 backlight_enable()

Disable/suspend:
panel_bridge_atomic_disable()    -> drm_panel_disable() ->
 backlight_disable()
panel_bridge_atomic_post_disable() -> drm_panel_unprepare() ->
 pm_runtime_put_sync_suspend() (.. power off)

So normally (e.g., DPMS off) drm_panel_disable() always disables the
backlight before drm_panel_unprepare() cuts the panel power.

The gap happens at boot before the first modeset:
1. pwm-backlight probes and preserves the enabled state from firmware
   (BL_EN high) while drm_panel starts with panel->{enabled,prepared} =
   false.
2. generic_edp_panel_probe() calls pm_runtime_get_sync() and
   pm_runtime_put_autosuspend() directly to read the EDID outside of
   drm_panel_prepare/unprepare()
3. If the display pipeline takes >1s to bind, runtime PM autosuspends
   the panel (which calls panel_edp_suspend() and cuts panel VDD)
   but drm_panel_disable() never runs because the panel was never
   enabled via DRM.
The backlight is then left on with the panel power off, which breaks
power sequencing on any panel but on the Surface Pro 11 LCD it leaves
the backlight controller stuck. At first modeset BL_EN is never toggled
because pwm-backlight thinks it is already enabled.

> 
> Why don't we handle the backlight state in the PM ops ?
> 
> Neil

Since panel-edp's runtime PM ops tracks prepare/unprepare state 
(panel power) rather than enable/disable (backlight), by disabling the
backlight at panel_edp_probe() we sync the initial backlight state with
panel->enabled = false until panel-edp supports seamless handoff.

As Doug mentioned, v1 did backlight_disable in panel_edp_suspend() but
Doug suggested that disabling it at probe could be a one-time work-
around to handle the bootloader handoff.

I hope this addresses your concern, happy to try other approaches.

Thanks,
Haipeng


