Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700412;
	b=kbWAGUmGh7x+IbfkdZynzINY+EKuTKF6v0iE3fVbKl0suzomGFLA+Xha3XZeKI691soW
	 uFE9rEkeUwriT4eK0+Vo+lC0ALhIoZ2fHVLVDiZGQFNpNI9fLwmpfhQv455cvPaWqfSq/
	 budut24flFHNuomXOMaxPMKm4Nz0VW9wTM13yDF6GOKooVuJnEJKi655hWQqYbIijKukL
	 5shX4joLzoE5MpE9TZanCXjAvCDXMqZVejH+fJRyOXy2ObXruOWrI5ZCrUhyfsu3MujQf
	 I2Z08jhvM3+81GteM3DMnBaAG9H2bWQddVWYeH/Cc080bDj2JpoklfkpahJMjAUZ11A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1RbVAc075xQofPostJ8mhRH6wVLYWfxo6Rcdp/ll7Yo=;
	b=lCvMB2vn+Lrp9ANmMlR+O9yVCEkkAagQhoMYUdM6uuVbjD0PW4t7TyjZIIuhXBGxfiqr
	 vy6TRJRGPpHsR6Kco5PEEpfpeaCeuC9lXLJT3ycOLe8wTzVeiZkg64N/xkz53whkqu/if
	 3YEIioNyJyZhGqbjaTKL+ug6cPYGb3/0SVq286uiMMa0ogVc+ZAAxXThGPXc2iSWTiGMl
	 i90frk/RU7dGbRXIvMNtNMsdiphohxncx5D4pDh4k809vW1ujqXP7JFg7epqOtUcMIgqE
	 i7tWq7cPPeRMTlSKAsAerY6nCOWAAaKC7QUTqCWh5mFM0YnHsdFv21vtpy54WPOHkNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cy1uvJpI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFC82jEw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A37606BFB9
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A37606BFB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cy1uvJpI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFC82jEw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3914Ch2609157
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 10:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1RbVAc075xQofPostJ8mhR
	H6wVLYWfxo6Rcdp/ll7Yo=; b=cy1uvJpIIU79xQq5ZgeRrrLvso5iaj0fckZDhW
	AHJRSyJBJLAT64z9sF4rqDli4G2fz4FnAjny1FMFfb/m4Tt39Ubi2A/KB03r2Fwk
	AQo6+/lwPbUo1DgHgTOb1atmruVJsZqdyF3bp4GBMpYlNffTOmZOl4xw5RCKpywc
	uKJTmcqS6V5MqbyxnzwZpnQVMyJmdslGQCsXqUqXQwk/JTaG/AFH4O4jDM2BKZDv
	LjZy49heXLG9bksxGA+Mw/XNDbH7ITGcLpI/dMbPFgDxWgglS4BBPXXMdYDfjab+
	stFiAtM5Pm8EO11sFwmY7wmfSzitbWREfNI5pGH0Q5q5VU7g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d9k3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:06:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so3527547a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793700410; x=1794305210; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1RbVAc075xQofPostJ8mhRH6wVLYWfxo6Rcdp/ll7Yo=;
        b=eFC82jEwD3JWTxZXHZ/3VUbjQIuT7w3u63bv5YeRrcwdnfUxgjhmiz8ffwKYh4pXQd
         1qCETLeu0TtPhi4df2iHiNvXGizi4jkQcDmYkZVI1jwQWbNNUWL+hJ2w+8AzwQ0uTnNY
         D+1MrO7H8zBEBzH6aSoNzwZjgO18hCR95PY5/QxpaMqOB2vqZ3ORW1Yg446k1pPq4whc
         Sj7o+8sHTphnEQsnjDjnK86ZKdsJD1XhXwgSAWQ0HOMCX3jvtQMv9kTFOBlz/mtKgGYy
         p+Y5rlnrpHEa2EwIu5Std/Ln4IjOVwInTxLmU2wI7p9a8lYQ/bcZqIftatBrCwYwtU17
         FKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700410; x=1794305210;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1RbVAc075xQofPostJ8mhRH6wVLYWfxo6Rcdp/ll7Yo=;
        b=OZIvv3otBTv4qHk5mHE/0oM4SDB1IUsL1tR4ueOVF8soJvEBMbq3f5nDSaNtclrPFY
         fZoVk+hjkf6UV/Ri59IUBQzmBXHWHfb/Xj2wjWZHTlKLb3Pgl7pbmMjEhlyJRw6gZOIY
         CUEwt4wg7weBvQh41NC5antmdLFIieSehMhcES6HYH7gZdSUBq5YdFYOxw5lh/pdTOnp
         iOazuPRKPVuwZWrCoQ1bg3am/LqDMkO6LZNBl36WXWS6QlqU4BDQvq67E6li9j2shyuW
         7HVqgPSfLLokNypJJI9gi50d5GJKLmn3J8E3nsyPuWpTtuhOdyl9UgGK+pJBp7usJ/+Z
         0frQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/+gsS+aSvaRG6axtlaQ14Maao4KCuw/lhHBGYz+DuRayd8fGA/ORck+NUZWHvX224tIDShHhXKSf/OV57@vger.kernel.org
X-Gm-Message-State: APuU4Z8mRPF+DrjObg9ZIKD0i70HwTZvshVHE0UVxLk9Z1PRg5b6ZEIm
	Fv0fHoi6JmVpUGWK6q/uFMGiUr0BWOoz/dhgVqacQWLLrs/ykjVBeM3E9XYPauf9n3dBs6Vw5b5
	bf01gzLptx3rjqBXobX8x4enilsZvhzySJosJAs9CUKQDSAC/BbXtzWjyt2b7slS4bw56
X-Gm-Gg: AYBFou1ytJGNno+XD6eXoMqgIGpHCOhyUotkW24E6oWqvXs3zhzxd1WRessY0eNA1hi
	NMKq5+pcjweqVnzeEZaM9QGxdPeWh2eqUXqeslE7ltghn0NpzZIqM8ghFjYwV+F8MQm/XDRWzz2
	v57Guhbpw38Mdvrp510I6aaPWFbXTRM79KolH+7dZ+FHw79l2ZCgAFKm34AfLKBRYXAUwU0fw59
	sSDj57xzX5ULYMtjRWVq5MrpfMEnfg+k8L5O3v59zae0ohWNBlXfibf5aErofh4gj1ULeTqvV8v
	sViUVGpwujYnZkshEGBmJckFmUvydEtqqfogrx81Ze6LzJhGUiRPQ+7SrhlvW3vGCLDoIEisgFe
	rLxUQVSOhKGjy15nkZCU3vB/99M7nzeQTW1YeiqZGhvfon3IfxEhErGTE04VUv9QkXlnV
X-Received: by 2002:a17:90b:3c8c:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3ae89735d97mr9768758a91.25.1793700410175;
        Tue, 03 Nov 2026 02:06:50 -0800 (PST)
X-Received: by 2002:a17:90b:3c8c:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3ae89735d97mr9768743a91.25.1793700409664;
        Tue, 03 Nov 2026 02:06:49 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3653640a91.10.2026.11.03.02.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:06:49 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:35:16 +0530
Subject: [PATCH] spmi: pmic-arb: bound id before using it as the IRQ ID
 field in spec_to_hwirq()
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANux6WoC/yWMwQqDMBBEf0X23IXEWA/9FekhiZt2S9WQbUUQ/
 91VDwPzZuCtIFSYBB7VCoVmFp5GBXurIL79+CLkXhlqU7fWGoeSB0ZNRF8CJqZvnwtlbQveQ+t
 SMuRN40ANeuh82rvnxfIPH4q/QwnbtgNZUYUMfwAAAA==
X-Change-ID: 20261103-spmi-pmic-arb-fieldprep-fix-5b63ff0ea043
To: Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793700405; l=2042;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=clyf+3AonUFIKKQvLMzFV7jj8ys7pb4VbCtLEqPQkpc=;
 b=c7OKlLx43t25IplywCobKfr2BRNnstQfKZrF9K43qOkcCwiKIlTgDUFKyYMLLCC/RSnZzxbc8
 CsONikjfbSiAZ3iLQd/ISpBxooI4AcPj2Uqr65rGzRgVOK+tTZkddc6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9b23a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=IBRSta3b0AKKeUE04AkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MCBTYWx0ZWRfX1b3jBBfxlbfx
 P0fNagwdE8LH5254bNvssy6BF8/8ag3WJW81SU1iJ7AfLNHQKb0UioF4AuRjrNuwksUy1iIGpAR
 2mP2Z0RuU1CCGq0yF8xmK+amt/pdY2k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MCBTYWx0ZWRfX8qVPPO1tTs3x
 589qQDfw10PLK4ct2i5HgvyC8t0neHG3QN/9sYNCj82sy35OlzK8cYj3OLsa+oLjiMjEtw+abdT
 99zQAK/+bh7yNxp0O3OSkFUjBHk+Tv2XmXRaA8tGUqqgsrTyreasHOqK31L6iTSft0A+4Z8o8u1
 PmOR8b7l3jYT/gUzQBf/drw9goLNTUm6uNyaR6t+O8yeTtx075ROpbac+iOS+q+twn7ZZXYDsyg
 ghgdafXn3STetOAnHzrTAa82ihCHuZuq82ArD2fVwB6cQTJj6XMGHiUDqEhyhh5a/T/TMJtGJuG
 pO8jxJ2zgbOnTpWKQekr6Y8iZ9t46ylgjekRV+dwJCI6X8rsh7b8vRo4korg07BuqbUO8kx/C/2
 BgBrkrcNZ5BkPZk/6t4mFvGHuh4oR30ds8CyzPCgprGmmZXbZAd8AwzsehMflFWrq5aSTuuHdh1
 YVxuM/DZVuvcgJqVYRA==
X-Proofpoint-GUID: WlBbUjhI9HWe7Sx4LqlcN-bFVSKOPJ81
X-Proofpoint-ORIG-GUID: WlBbUjhI9HWe7Sx4LqlcN-bFVSKOPJ81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030040

periph_interrupt() derives id from ffs(status) - 1, giving the compiler
no source-level guarantee that id stays within the 3-bit range of
HWIRQ_IRQID_MASK before it is passed to spec_to_hwirq()'s
FIELD_PREP(HWIRQ_IRQID_MASK, id). On targets where ffs() has no native
instruction and is expanded in software (e.g. MIPS), the expansion's
internal handling of the "no bit set" case lets some compilers prove id
is a literal that overflows the field along that path, even though the
enclosing while (status) loop guarantees it is never taken. This trips
FIELD_PREP()'s compile-time "value too large for the field" check.

Clamp id to HWIRQ_IRQID_MASK's width (via FIELD_MAX()) right after
computing it, so the "no bit set" literal is bounded to the field's max
value instead of overflowing it.

Root cause and fix were diagnosed and verified with AI assistance.
Reviewed and tested by the author.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610260532.Zb5KDgRE-lkp@intel.com/
Fixes: 815be38ad8c8 ("spmi: spmi-pmic-arb: add support for PMIC arbiter v8")
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/spmi/spmi-pmic-arb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 402ffeaff8e2..6f8a490f47a3 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -736,7 +736,7 @@ static int periph_interrupt(struct spmi_pmic_arb_bus *bus, u16 apid)
 
 	status = readl_relaxed(pmic_arb->ver_ops->irq_status(bus, apid));
 	while (status) {
-		id = ffs(status) - 1;
+		id = (ffs(status) - 1) & FIELD_MAX(HWIRQ_IRQID_MASK);
 		status &= ~BIT(id);
 		irq = irq_find_mapping(bus->domain,
 				       spec_to_hwirq(sid, per, id, apid));

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-spmi-pmic-arb-fieldprep-fix-5b63ff0ea043

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

