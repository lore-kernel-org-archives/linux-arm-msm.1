Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592563;
	b=ZbF1NJa1OeHDOkrfQHRMjpKM6bVbca4T+9fcpF02Js48cI2+llBIO4p2NhpPiiynnekt
	 sMHvNXxEujWHJl/WbG1lQUIGOaV7Ik4ee2HPz4CzqT8DO5N0zIIo+MhM6sxnCxH7BohlB
	 T1ya8B6L+cDfwTk8X9D3WFgsL0aknGt9sozIYGz0LNGPXuk+xT7LSgOVjYB0UwcUtaEo5
	 nAY5VZab6q7Nj076pBAbfJFrqf/pzMliGR1nAGVeVFc4lWvEgTJ/2iN5TXzU2tpTpq1BK
	 QUmzmQfh7GtWgaURw+GNOneAci+GCmywrNYEhZwCdTy1o5K0yJ3GdPJTz+H1DOYxrFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
	b=Ph6VbRjzbbBqAK2ujD+acJVRM8QB5S7NZqsfgs+zQuo0c04WbdKfeOm2pv7ntIyVj4XG
	 uuPUkojx8BNmFEEPe0MnFX8ecE2OjRKBZ3CHtvSgfQ21jS+nr3APPy23ixy3Ro90LzDNL
	 2SEj0rYZ4aBe8oDS8HY/9SJl1m8feD6HVUv0Xt9FN4xdVBKe9Oefp5cuNPzL9r9iayyZx
	 fSH4EP76JmFmdU9PBCfx4TZsn1jxh0RK1E+0bq1WsMclY9Y0WDI1FAq//lPVCWt6zXUve
	 GgUYNeglBuW2MBLwoPDcT50eNHfttyQwrbJceSTvhXZDWXoQvy2q8Eo71vaDn0ArRAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VewUM90t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdiEhipY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA1A60A2611
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA1A60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VewUM90t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdiEhipY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFK5j1904155
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=; b=VewUM90tac1EJ1iD
	u2kspP3k5ottnaeCKtfGoIvVN6yjkn6NOJG/esUL6PM9njmP4XpFo/u2YgZihGXL
	SYIZy3XhPjHiWDh7foq1K0xW34hapKkLbNQj4WwTLjjYoz8k34D6zhzQzIA/vlfT
	GwVAyexTgrJmByVkds4JfQ0utjNUYbChT5mz3HQicLdfVMfTzDHtojEpLMqlSK0E
	oy+jJ3fdqFtHqwM8kJkaeZN13+Ut4JQSCSaWFdq8pW0jupPNH9tea1J3UzvwlUt3
	e1Kvs/B8WA/i7p3VP8WLbGqNeFj9TbCoh8266hbvQUFV4n2BTbM2SF5KKnOQ2rfR
	3pcy6A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4vbrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35935fae332so78456eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592561; x=1793197361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
        b=cdiEhipYGI0cVc8bc20oXkv6yENguEr8yN2iuyM81zWodf9JM66QQ0wwv7dozhd2ps
         wZ7ZwdVb0jyixJjSdBXHl9UElg176Kzw6d+8m7RB0oKHnKaFuZtRNiKyQVy8pn66JZcS
         Mi0wKXP9AR3v4rwQiw9Uhj9k1EVCcTwPxerF5PMkWOdEP2BfimLAogwt/V32pNXjEf88
         qgrFUrYFRs7sOlCo8QACO/PO0dTgub9wndWhqLnsyTIqJ6i7v2nZiOH4UoYHFhBM0J1U
         WammE1Firrb8jjitaMd+shq3k/Rtv7748gMdIU3lCp14maB8hj6DuEy1Aw4tPU+j/e8X
         8tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592561; x=1793197361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
        b=lEdDRIl5Ovkfezl/JOsFy3IQjQf5cwVjXJE/CMc/1V3ILJ9bpIiXBiOmMRyapZEyoC
         wz3Dy/M1drhM6tqZJDrXjHw4PlQPH+0CheHmPFsBug8Rw1CRPO0JzqvCjUUIujo4QpdW
         IPzJeIb7pIIydJgfeFmkMNnejVf8s+IOIY0sxJhMH/Hxvf8u4IQItsRbw4s0gx2eUCO+
         D3S3tsoKe2WrKAxGtsrhgPoIafjxn9dnx5VdFIBsS+P1TxJemLxkgIykV00thXJeff9H
         uH+Bws2PNcgO8gkFKS6WfOEAbOeOnCwIpgoa7mYluhpesetflwiS2fGaDb5unwF9q1R1
         1ODQ==
X-Gm-Message-State: AFq9FYKNc8vvSzWhosaI8OObyOg1xBMwM1O5//OoVXBpFCzW/LHZImZR
	VXjYgHNGzwoF5fcFL+mCHl64fpmBmRKhcMg4iuOzr+q90nOOphEyii3dA2yV6oxuThhYhBcgsP0
	l1B1Q4OUKtokSxdxXwPScUUFipmxHyXBfpFt4egSvd+BzwzfJu+FP6tVlEMivwRVT+e5+0w2fib
	kZ
X-Gm-Gg: AYBFou0WJCTMAUebAROQRYKb6cb7hqJ1FxPkLSmM7mm/9iT4lt81Lqa/Uukd0pq8xcO
	4zUNyr9Ts/FIv1NzOwuYZS9WCqZZtarAWfnFIC818RxcCK2/s0PSKL9E5IMgV2XUUhc8hTLYiJ5
	RlyX2mmHB/vYyjeEfzPPK2TTdq8wEDwSNXjKvcCGoo/mthozI1LzifGpQv1P48w38wfUjDmyZ5g
	CDg2WS9RIn6Puty3KBd2iZYhTRqxHPdNkflBnBXKhY+sPT8H00GrF1fQuewLO78e1faAh613+XD
	6VA5OANX1HCcB4qOti+Q7FM1THC5V7OG0QzawiIgPKHMjiiu+nDxw9Ed582w+0czgschctKfeiR
	cCi9dc7JM0r5L2gky8fIR+4Hf8hWt12c65aOufmCS2vLqSO5b+9PDEVf5mHGifxxFgo+ISHVBUk
	taqcVsVBP7MG5EI5+6AO7Uf/OgBAPwwxJvWCBLeGoLqu0bXyRGTYw=
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id a92af1059eb24-190a370711dmr3992477c88.2.1792592561162;
        Wed, 21 Oct 2026 07:22:41 -0700 (PDT)
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id a92af1059eb24-190a370711dmr3992373c88.2.1792592560306;
        Wed, 21 Oct 2026 07:22:40 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:38 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:47 +0530
Subject: [PATCH 4/7] arm64: defconfig: Enable RPi touchscreen V2 regulator
 and ILI9881C panel
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
Message-Id: <20261021-shikra_display_overlays-v1-4-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=1221;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=U8f+j/BLf/HSFgdLnfHMeSGonjaUCp8+bl//vReoFnE=;
 b=DzMMfaEXvKx2FFuZQfwCxTAstnLov5p96AEPmDFiRpSHF3LH3TYw/+3dMpqJct+TP4Xzzc2rL
 Py3tRE/V3FsDndfVbDG11q6MLSzHliassiWoyYADNnoENEPXXsXiYJi
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: 00YMQdOg6NgEMEk5vAtIe-mmvPksRJmI
X-Proofpoint-GUID: 00YMQdOg6NgEMEk5vAtIe-mmvPksRJmI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXwrUOa7fGTS7i
 GWrkSY2yXuZqtCgop+y87A6xlEZLS6TvMIlfYiH+fQXdm2j4NvNHYyN793qaLu5dZz7M1LuJfP6
 OgfduST0OwIErr6vbGt3bHu8i1PeQwU=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8cab2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX2OYvxkqsntiY
 6RAjCzgugbtF0jLu9mvDlGvN3i+qqNFPjXPo2d8PsR5daCvweYS4UTy/Dxv0d1182pvTHOLfnqj
 P1KMf5lAbagiu5CB06Ao3SxMgqYhaNi0jEDx4myzyZA0mdY7vLMvkqP0fAlVcKp1+elA+9Tda69
 GbXrRoUZTebngJO4pbPUwcoSNva0MTGwhhMF1hC84XwaPXeON7VYY+uQ+YNYPagNTYykOE/Zc7C
 FrBFzesPbmf4ktvYzmNuO/qxWFp3tHqO+SrVJ/fS9LF/Qokk+GslPc9E6ymrd9i7aHigVGDTs6w
 ZF8w8H2RG6hXGOPD54OkDrGkoa/hXiKWonQ1S/z1iDAO6+aGWBcU6fuYsGZr+b6nj/FvVFOSrL1
 KYu3K7eeh389qwh4svi9P6b4D5ysVWivuEu8escvIcCKPuG1H6jXr+nzU7r6E94xi0Y/EC1Iilo
 s40bsd8izn6/c/AazJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

Enable the regulator driver for the Raspberry Pi touchscreen V2 power
and backlight controller, and the Ilitek ILI9881C DSI panel driver, as
modules, for the Raspberry Pi 7 inch DSI panel on the 22-pin JDISP1 DSI0
connector on Qualcomm Shikra EVK, Talos Lyra EVK boards.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d18f72e55330..9c4c47a44af9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -900,6 +900,7 @@ CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_REGULATOR_QCOM_USB_VBUS=m
 CONFIG_REGULATOR_RAA215300=y
+CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2=m
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_SGM3804=y
@@ -1029,6 +1030,7 @@ CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
 CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
+CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m

-- 
2.34.1

