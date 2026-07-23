Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0B240627B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803164; cv=none; b=ZYsreuJRIufzv4geBYI2CU8GUgehEq22H4U05jmqHjO+ev+XyTy2JH4FYVndnSd4ESETlLYDXobN8pCec6CEEsIQoT9LH6ecs1q4yKAeWYk7QP3yge+Sk+RsdX1yIf+4m3+Y3SgKYv4N5poASHqYs2L27zgVo3PlDnajSEwwD3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803164; c=relaxed/simple;
	bh=PBlvVsvGr+bykm8WnMhzex1smC5AH7JlTemQnJwn/hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lPOGbC1h8wtUpae1aP1v4H/YbakxhBFo1mhyvPcs9Wp7p3B3yLYNPN8+d6u03r/4YF9lzO7Rei/HHt6fzT9tso5n/MGafZWQcvrDnBNUYlr1eTzQtBD7CYtFBGHP0VmH7XMn3YUotwTck0a0DCkHC+xzKJGpdDDkEB7++eSf7I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HM2K9ao6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVyuGNHG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HM2K9ao6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVyuGNHG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qdEY3648888
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xuxwwHnpi9Fid00zPXEaRRM79uQz6jYd7duTu4iLeQ=; b=HM2K9ao6bh5VGGEw
	klLAt9olwBvQUG+TOCJHccBRhVHgCbhQnwHkPXDhR9FnGs1qxFJqGLCxqa+7ZN9v
	PA1e4/p5LwWJE9thRYuyR6AMTlQbc2JyWKjVz6uGF5Kg/ccTsIMGv+7APxnV/REt
	dcVqLuCmJnzYcZuj9unOolcsy8rEmwyqkBZTZVfZsUiLi6EBrgozpwcWqfegly+I
	hSJ+OZTipjQNqq4UhrpPWezMcT/vs4d/AD5X4hIsWmKgcHdfQZ8hWBVMo/Po0BMu
	ZDw+xd0AmCpjDRapFpCJSWn+O4GXA8YtSNunkw1NaOurayYOsPS70MM8GyCQPsxi
	AyL07g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jjnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485d853b08so1329875b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803160; x=1785407960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xuxwwHnpi9Fid00zPXEaRRM79uQz6jYd7duTu4iLeQ=;
        b=KVyuGNHG9xpdNQ99VAXlmru4ElxZsCHjRXLQ1Q4vi8fUQ3AaO5s52MEMAEy6i5vq6s
         mzKBryOaxyBSeNo61tJxFWxXM/7Qbgnj1/x/138zZBcss1O/VXwYUojw4HV7CAa3SPh2
         xEqrHTPI5b6iMrHbI00Yz5TDLquCzkikYtC9q+2sMgPkEn9lsVBFmjqN+4bFeJ1PlHPQ
         lyuJkMrEmDCa5SuDMm/wRHiBmt73jjFKx4Xfgjcmqklwfoarq0pwmgOtDlfeItleLepc
         8s4YGGQdKuflG0lnet8aHl5Oc/EkvX+7dJrTTEJM/B3SCqRmE8ojlytVkY2UoJiaTugK
         1RyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803160; x=1785407960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xuxwwHnpi9Fid00zPXEaRRM79uQz6jYd7duTu4iLeQ=;
        b=DpvhEaKqmAtSrHeNRramvxvLB4SO6ns/ERTFSNwm7MXfugGVhkBN1NIz5+2c6w99aH
         JWrLYA6r+chg08AjNa4VwFXF9AtQTrU2EQ+1IaDhJwFV/cX401UW0viNUIQu6JB72MxN
         OebAK2/p3U8wRRIoKxRCwwjaTZRrgXuV3Hy4A0Q4Zy39x2iztfKiGsam1Yfwdh8fW08W
         n5si0X0C+66Zt9eGrpY1DGtKOrf5V4Uqwkb/Gsd8mrU0zpsX9GYiH0qy3mvt182ccC7n
         iBk9cR3Aup09I6ybMktuJcumKBC/d7TksZkOYG9hzdMJJHXiIi12rGeB8PU9yV1iOgaN
         GTKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqp2gcPY/LTQchppkvv3mgDAUYAjbiVLL8Slaxvq7OiEXoNuIQMXc/LDj70IMQ71Vx0YChRFVL72yQNMK6w@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3/ofwkGP/IBx64ngiwPLs/+1q3x2GonNXfgKt1/Si0n3EI8m
	rBpc2c1kOTTJz3Fk+75SWfow5wVZdBFHd774hTkBEOlbVeWG5RaSvhz4eGBdwLPOYzEzf5m+HtX
	//RgGpeSrThZp6HaSpFXtSl5BzOrwkF5b4j2usVX50NfLaSTMiI0Mpa2GeSx1nQ+eLtWv
X-Gm-Gg: AR+sD12zisAld5Ew70LPpakZyTu6cDkOFZid1nic2GyFhFTaXWHctCbin/dNgfHkX0W
	Ohfa62DdVPqKFy8rz81o906w+jutWCe07343ckV3RMk5Gz2YNjuP4/WOl3Ca4dhsXcTPpxElXBj
	zXMpMFZOxyfiwUc7uxdmqM0jmkkJ7vqJvSx142RYbKr1PBl5k0t+R8SlWP6OtpxpmKE1lkhA5oE
	qAeqyi0PJTrkDJNBwxl2RrXCmI2sfQWBcBHprgpGC+WWpTzXMavd9tcNJ1qZj5/W+MRVbzvgXkY
	tgRmoQea1cCnOSKLA9MeW20XSwuf+Sem+djKaUFjlddY/pFShYMmMn2rouUA/o55dLZz3yqoAUB
	oZXdaEYa2ef3FTk4SppNOfQ0ExCd5yirc7DW6Gr2yHq4mN0J4NvGUi9Y2zf7FVzTxv1X0Dw==
X-Received: by 2002:a05:6a00:3305:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e2c244122mr2705012b3a.64.1784803160526;
        Thu, 23 Jul 2026 03:39:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:3305:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e2c244122mr2704979b3a.64.1784803160120;
        Thu, 23 Jul 2026 03:39:20 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:18 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:09:04 +0530
Subject: [PATCH v5 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=584;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=PBlvVsvGr+bykm8WnMhzex1smC5AH7JlTemQnJwn/hU=;
 b=Ig+LtmVTjlW6psaSiwo9MZgmFk6Unrs5ipwJbEhMmqnVTfmBdsIEdjhAECedPrDJ4SusZa3CS
 JCHXuEPmk1WDAs28elvozcRyYLraE+9PDQVsje9UcyL7GuDG9dDcfyi
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: RJRFAApIBegFla4vLX_let6yxiZ07NuC
X-Proofpoint-ORIG-GUID: RJRFAApIBegFla4vLX_let6yxiZ07NuC
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61ef59 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1husMANfLlrnribazw8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX8hFR7yMqPhOz
 oMw51Szm1mqw6/H0CDtjzJ8PaIsJaInqkZzTE39KpnXhAvgObTpQKI7qQCz0pvcGYLOA5tCRIAe
 DbXA931JDj7aJCe8KXNPlDPxfy5dmac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXyI0Lj2RW2mRJ
 LqyonKW3lm2QcYzduHQWXv/ht+XONnaWY8QIliWYJNvKCpWlRqaSpPAuXav3lSZdIaITcc189Ir
 FQxlW9RWHTD6stGhzolpvYnHwX81L6F/hOKYmjtCuzKojgcB7AMpkdQc9JDvFMM5bgi3qUPPZdI
 PZv3YtRLRPgeR+Jz+wbyEnxjxEFytsuYopjYw3gSAV2oknY7qFjPU2rt388Rz/dWM9ZVT5gdXDp
 ZFpQvQ3fb8tJ+IaIWAcNR1KOmdVDu+VdC0rIj6Q2DMIl1qOoGl1qLaHvYb/IL7QNXJRXISJjuz9
 CBYcFf0v/LIOPyPqA9tCqBslV6MojPcHGOZ7BUvLU3UWyA8v4I9tjWAZyk9sDxatRCv33zKVeqY
 tS5lO7DLuRItsmZOxiTMINw2yX7HCXqItwSMjfbG75aLrBue/1+++p0R9QqM5E/0aerkI/i6mYw
 cM/iBYattwqlXQgdddg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

Add definition for EUSB2 phy type.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..555a022c8c0b 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,7 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_EUSB2		14
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.34.1

