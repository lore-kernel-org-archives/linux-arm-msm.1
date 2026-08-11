Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB0442DA23
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450218; cv=none; b=Gr0P6i+NTJa6a0Zj12zV4/dHTbWuUh+25DgBOr58t4UVH22jOJSYfkEcA9SVVn2xS2R+VGrHDekmuHmzQ7c1SVsavTYwPG6R5ibuZFF6JzSHCj/eOUUXEMQUtEuKNlyeOBvbaiU4tk7g/TThEXyurBfGPMI8OAeR+wOnr3MF+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450218; c=relaxed/simple;
	bh=M0klPbpMKSDb83aeDRUr2B8G3YjIwJhy28xYU7z8QLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEFGMHCs0lm9ms2/ITnxNudGpUqmrcWq23uV2UlaClc32PQA4caSQZA5tWbEeDN0AzqPbXxOP9+E5NQla+Nn558NnvmT03ujfvl1XuWA3RLHB81uu457pHupBYBnTJvMyy52bfnkCrRMfGylybOvZ+gB9hLA528U+XImDLOIyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3zRSSBr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3zRSSBr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b015532f7bso2831796e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786450214; x=1787055014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJUUpA+u/X+Mw8WGuh26FuT0SdK7L1t8Py4ith47VDM=;
        b=A3zRSSBriVNhHHC0kVcqmyAKY5sdk+rlxwdl6FoVzDAPXcv1S/a+Dss3LK3UsxT+pQ
         T0w7R5AncVRO/FaiyZ73sIrs4MqwjE41wc6k1tV5CdHjzmHH2MCvRfl73osAoeorSs04
         91iHNga5qv4xsU3hOP15zTI7piojNLwi9K0C4lK8m4Mx0VDmrWpmDHS9X5D3/Sszp2NK
         XDNIr3IdCMfaPpAAK7DKf4GubNZz+pRqksYeMF9gMiz2LiG+t9yW1nCftAH1Wph316Tp
         iT6l1X948JRzDe5H+ayWnZmrpSe/LqFQwOPwp7Sorq5tJgHDxfNm63egnIzVnSgYVmcV
         0QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450214; x=1787055014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJUUpA+u/X+Mw8WGuh26FuT0SdK7L1t8Py4ith47VDM=;
        b=GsXz/Nzv1E5TeJxa4DVVWPHrwiIQBF9a2ll6SF2dXMFFLghEmMAbYUKDpSKJKwqGH3
         xZflY2XYGTyrxPDBWjDWVad0Iq21P9iUor/cP3Adieyq/HmIMmjt74XltJbEELGTcoth
         eNN77ULhlQfvZWTFZCkoMu070EQGxZYiLu3ak9nvXdx7VmgNsx3RJds2pJCPQ/fFf8ng
         vbhSAiKfCpIJNIFuB/iTRiyMXFohkbQ8gulW65EJ+96NYl4mpjciuwVp+3MHl/v2iYuc
         WHiwxtw1pmMJV8IrA53YtPaAjqYprrCVJ0XloEqXBZ/eF369nQDC5oKvF6lrz8dpnoAM
         UWtw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8rdEXNqLmmDD7FxS5JkKN4hyCdF9W6WNrW+u0aTKtzTvDqAvMNT3hJOuJIWkMQt8VSwhgeX+ov/tw4rop@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr9m010ahgz73n7EqUZh+m+Q8fN95B9ivcus2X4+KabxHox8d1
	Nw0T5tSDMW/O7Vj2FdNUHKJUakRybpvpU5QszowXvgnsu+aN9JNgTpgb
X-Gm-Gg: AR+sD13O7tDMVmutn+/yxOMsxVpWWbmqtRWjC76pmb+h4zlW6wKeKFnVfFrW5pOq1S/
	WMfubRqvJhijFvj4vHA3zHh/QrE/ziYWWnweuTfOdFSl2D5vJPncRJx33DVIDsSkyYZwVVGkONE
	fD55iAZsRu+t1q4xvDUkcJjBIZjT4Ld1pDSKaFAYtlf2PNeyMDThhI86r7GfdqaD38yXAr1C0kM
	HY2YnfqwdQcGYuqG2z0OMKcnjbcB+74ZCDAAJbz2BpO0CUbwRR6lbdn0SWMGerdphclCO3AqNVp
	UlpiQMkr1ChsRO2HR25hcPtgFf4If4rBlogtB79INGDV2Al6QCpAnNPJ7C3792eWKcukCziv+qq
	Al3wOiJZKtCm6Ap8DNR4UdM9E6zBzRymvSX/Cyq6heYQ+Z7Ly58/JVGzmaqUtbbHMwSWFzjL8Yr
	EXhJbdmwNvYOW6IgCxHeAyRmuQJxEwvREZ2xxZKxbAguVD188u/MHMi6Y2Hvuo41nE+wC/tOA=
X-Received: by 2002:a05:6512:12cc:b0:5b0:1b78:4962 with SMTP id 2adb3069b0e04-5b44866ef23mr489653e87.50.1786450213825;
        Tue, 11 Aug 2026 05:10:13 -0700 (PDT)
Received: from hekasnap ([2a00:fd01:82a4:d100:739c:a0f5:97b3:63a7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486c0a14sm238919e87.1.2026.08.11.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:10:13 -0700 (PDT)
From: Troels Vognbjerg <hekatombe@gmail.com>
To: kamal.wadhwa@oss.qualcomm.com
Cc: alexandre.belloni@bootlin.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	raryan@qti.qualcomm.com,
	robh@kernel.org
Subject: re: [PATCH 0/2] rtc: Add Qualcomm PMIC RTC-GLINK support for Glymur
Date: Tue, 11 Aug 2026 14:10:12 +0200
Message-ID: <20260811121012.7046-1-hekatombe@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
References: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com> wrote on Fri, 07 Aug 2026 02:26:29 +0530:
> On some targets like Glymur, the permission for receving the RTC
> alarms is routed to charger firmware running on remote subsystem.
> 
> This is because Glymur boards have to  support MSFT's `TAD feature`
> on the windows OS devices.
> 
> So rtc-pm8xxx.c driver cannot recieve RTC alarm IRQs via SPMI on
> Glymur. So in order to make the IRQ available on the Linux kernel,
> the PMIC RTC Alarm IRQ must be routed to APPS via remote subsystem.
> 
> To implement this, add support for a New Qualcomm PMIC GLINK RTC
> client, which will request for RTC set/get calls for time/alarm IRQ
>  via the existing pmic_glink interface to the charger firmware.
> 
> Also, add a DT property to explicily support enabling the RTC
> writes, keep RTC writes disabled by default to align behaviour
> with the existing rtc-pm8xxx.c driver.

You mentioned this patch series applies to targets like Glymur. Does that include
the ASUS Zenbook A16 UX3607OA, or did ASUS do something different on this
laptop?

The reason I am asking is because when I build this as a kernel module,
I get the following error message:
[    2.241461] rtc-pm8xxx c426000.spmi:pmic@0:rtc@6100: probe with driver rtc-pm8xxx failed with error -2
[    2.499556] Modules linked in: rtc_pm8xxx aes_ce_blk ghash_ce gf128mul sm4_ce_gcm sm4_ce_ccm sm4_ce sm4_ce_cipher sm4 qcom_battmgr rtc_qcom_glink(+) simple_bridge display_connector
[    3.277788] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[    4.318666] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[    4.319085] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: registered as rtc0
[    5.359404] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[    6.400331] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[    6.400496] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: hctosys: unable to read the hardware clock
[   25.447761] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   26.488271] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   27.517573] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   28.560114] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   29.609224] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   30.638629] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   31.677524] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   32.720749] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   33.757662] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back
[   34.808360] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: all time sources failed
[   35.837651] rtc_qcom_glink.qcom_pmic_rtc_glink pmic_glink.rtc-glink.0: 0x68 failed (-110), falling back

And the error message keeps repeating every second or so.

--
Troels Vognbjerg
