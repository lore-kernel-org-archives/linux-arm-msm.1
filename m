Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29F31F9B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651211; cv=none; b=W35vuN0yBUS64dmT6cT25qwHAf0uxViFYbtAH4lHkqr+/1DkFTXMEZptJhWzRbMJogovbguYJJg+13ijJnvKLkrYLHIGqBFDp6MVvWsZeRXonGTaWy9LyRa1Oc8irjHsOSstbyqoxSHefpbeHST+CFEH+Ufc6XmHjAvl3A9KrCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651211; c=relaxed/simple;
	bh=9NnIK1j54yTLTupsl99W5HgAeYajL/RJxQ1MtDF7790=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvaGNYpISS0RU04uKvw0cUBgHNaMsSwnz5Q8hKsK4Ae1YCqkNn2RFzfmu6LvoVbLvqhJEYY82/JUEzuYTxHnjRSQ757EjMhrzcmMxTQGm7m9Z618L2nyLtJHm/9mtpvz6TM9p91Z07C7GKSWmTbIOpnzU+wh6d9TyMp4K4ugmLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxR/G2iG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbsfkgCO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxR/G2iG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbsfkgCO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX70a2327444
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CXAJyfvDbijcYUVgmSdwnLruPWsN/fjlA2uvO1ul18M=; b=lxR/G2iGGfHECJrJ
	zSmuDcSfBAX1+6sFowyUDIceLlPq4jTfyyjszf8yWE8FOPDfL+eYEClQT3jsYDEZ
	Qj8KNbi8cvNcycf2uWz/9cR9ratI5Cq+AwSljiuFg+QKkrC2TXkZERRAWwlfp99j
	GWYffbcm1zMC4U9QSdtEs9arp0iahU9hcjiAFREUmdq0DZv3HIstt77Am6RnkJrt
	tu8tGyoFqlpn4/Nqdm7ZZmQdl01IF5/gHE6Dj8uNKZz3LhumMzg32JQNrOnBlXGd
	X2jAa3ps6NNDjOTaF11jcMUDmD4CSxDOg0SLAJdU4RtUKBWEPDrq89/TYWYxWO0E
	rabQ5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24t531-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so751502a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651205; x=1784256005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXAJyfvDbijcYUVgmSdwnLruPWsN/fjlA2uvO1ul18M=;
        b=gbsfkgCOMTZokTcySPzwkwvJjUcuVg/12Mv6Kk8oQA0E1/bFMOvHMmuB458S2fqGBh
         +8cGT4/eAKeLaZpvTzFqSq2BomYCsbRa/vZR9bnVESBU3pDSbJdhuRuELHMTuNO2zR+S
         KDBEkp+TbHK/AM0WehjHy9BsER60kacIQrTF599cr8tbrRwjIOXwNn7E10GOr2Fsnvlh
         6T8Ngff/cGBzk4x53kGX3C0/UgkrHZyv9ytQvP68KA0INO0z4S8hETBfkTPrreXGzF9u
         /iLDuoSVNboJL8iRJbi+etKqMPpuAvflJDRi947J4CZoCbi/VyAet2bhCIINwnkQ+H3y
         kMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651205; x=1784256005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXAJyfvDbijcYUVgmSdwnLruPWsN/fjlA2uvO1ul18M=;
        b=eFOZOpf17xdjC7qKExQKJV0+oOuHVxq7v/ZqBT80K1WWNCFCnb/2T3X1HJpznxFEJj
         AFnQNeN6OEAfGGSjJPTuwsIxAlebQY/sfJuAoHSQDso4CMDhguUFOZMBrOR7dD4NZ3KN
         2B4CLXpoydqh05wDaWhv9fVE+8U8HtbTRcUilqlZjTaRzvSix/tw6GdkLUBbnIFluZgJ
         wglGN3Js0l5h1kGugJ356zE1FnPAHBtSO9pFOojoFNH8bQGj5EqJKBC9ysqekmI/OtHq
         OiMtnEmWyn0mgcSVoNhKSP5Dv+nmuTkJTwSwSXEzcyi6GZ9K1rSpJf8rj7RoiwPK9Xv4
         YVnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFy34wMK7eEc6TkOLdjqtEnm43R96Ln1yWFXpbFNf0EG0Le1+OB6zJ8OsNO43vwKNhR+lYMZ6vP9+LQYCi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqe4Pakze+2bruPDmiZfI8h0lIutYbts7+ggJ1GK9ONib7kWM4
	3/Sq2JWvbjMasZJghp/pLarWdpjZH1qe9ai0I/b/CDwC/wuh9wf/4e6ERLWf9Do5xrgaVJsWD2w
	zA2iz7Y+NitQqi/we8yEM+5mpE8fptlfmvKCh3NsYMoYcNDa8kYzU+usZgj/XWiTotc/2
X-Gm-Gg: AfdE7ck8+pg0W6GKi9E/LhfeIvoOV6QviMsk1frbxrgVPRuTJY+sknd6ksVrmYdovXX
	dQCfeYr47KbCzXVU9kTugL3MpINOnZ8Kjsp9nLsQ8YTXuzaHArNTR8OSGZ35iI+4ZYDOKh2KxfC
	e1ZLCCW3MPQpKuO6TeXRpxZh85pOUObCQh8HEkVOsvQnsnn94/iqi6OGsdJQSCgeeAKtNhYbVVx
	l6xQy56a+e3Tok5h4XFK+OOT+9Wg6SLEUust1hdsCg+OBa6gJn4jM6lw9P+q/iOuHjYKkDoio1q
	LPG2Q8862Lq/AaXGd+mU8rpJ/RcFxAAlz9/ocdb0x5qXCgVObLuQH+sMqZ4jcXlyu+g33aH09gA
	dY2k4rhUTh5e8RS/bLsMnCXIVhsWSNlj+eN2AEhDX5lb9
X-Received: by 2002:a17:90a:f948:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-38d13f6038amr1154526a91.8.1783651205135;
        Thu, 09 Jul 2026 19:40:05 -0700 (PDT)
X-Received: by 2002:a17:90a:f948:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-38d13f6038amr1154506a91.8.1783651204660;
        Thu, 09 Jul 2026 19:40:04 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm38300227eec.31.2026.07.09.19.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 08:09:12 +0530
Subject: [PATCH 1/2] media: iris: add Long-Term Reference control support
 for ar50lt encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_ltr_support-v1-1-458b587268ea@oss.qualcomm.com>
References: <20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651196; l=1879;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=eyk9z2vW5/VibGj9Ar1yvrbi2OSzHoMPb9BkI1P0FvQ=;
 b=KijEKIuL1m6xW5rvvbtw5+DDXcIivju810HsmRjHpycJXuKcbXfTQSTcLtMNDKRYquYezWMdm
 rBVpZ3+lvT/DGECrXQwSOf4acYE2jpoZJ0qux7H0F+wntjG1kuUs9OC
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: DGu9eRt8BscyyArVCVZYUzDUrbDomD8D
X-Proofpoint-ORIG-GUID: DGu9eRt8BscyyArVCVZYUzDUrbDomD8D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX5N0kEl5045Y8
 vk/ljwSh1pldTQd0D0TQjTT7zFxR/mbN2frXy6TkurocS1PBVA61dLxml0v0IX1PTzaHyPGyNEG
 r80ZDZC9fl2NE3c0kf+tPUs/2FDYWwc=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a505b86 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kMRPvbZiJaxPZM8SQqgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX28mL8ZB4IgFI
 n5653ca348rcGJXUROfQi/8c0L0oJ7HD8K/MbEPaIpnn9NeR5x2lqr2ejg/yYhUrntVuw/2KfwJ
 Y9RgNvxqag+qKdDkHgDa1te+Atgc3mB5rO70FCic3bL3tZRcoaJOvSAXsXZi818VuJ5Rf02gn93
 LgNGslO0WYG2W7iiO7V69ZF4jQ5TMZNZWPDYYJ6Qxt1hGX6oYXoAdnCaG3tygpHzYoGrS70doOr
 MsLz6EliJrqX8E0cz/msQRH6GU7dUbwDsp6ZFcTgsqksdQaSVpQ5GtMAMNHqqA3sKlvg1EWHczP
 FitmjQ12l47ofvt+CVOiMqUZsDmHtBpeVNVGnCALFy3nOaZ/G0f/LXut4vjrVYpK5ROhUN9Xrq1
 X+WeFnOMxflejEuyUnUWVFQy0xg7zDrsxlHEMa1+pzWQZF3JvmE36yW9129QqCoYjkwxJTQYdus
 GjjpAWbBNwEw4U/347A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023

From: Gourav Kumar <gouravk@qti.qualcomm.com>

Add Long-Term Reference(LTR) frame support for ar50lt gen2 encoder by
enabling the following V4L2 controls:
V4L2_CID_MPEG_VIDEO_LTR_COUNT
V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
The ar50lt gen2 firmware supports the corresponding LTR HFI properties.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index f89245269e8c..ae0512971e8a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1669,6 +1669,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN2,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen2,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_USE,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+		.step_or_mask = 1,
+		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.hfi_id = HFI_PROP_LTR_MARK,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
 };
 
 static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

-- 
2.34.1

