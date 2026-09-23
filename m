Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ACC499F01
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179324; cv=none; b=ZKS3I/9GRl/9Miq640JFeK2x9T+be5+dHI6zT+pcZTMg88RLD+ahNHJtRSUUCegmL9LIy05mHS/8G8Zx0s3PYPHhFpwan7OclU0AagssBf7+VPS6/e3zO5vp94dQfiP/5rGKXW4iwup7iUBeKlSsyqoAT497xSRm6hp9ctDThbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179324; c=relaxed/simple;
	bh=Dzpg26Vur2DCvULsTE9E1JAC2Y7NSf6GVeoLlup85aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3cbR1/3v+TKUNjg8eAZcYgvR2/dJU+GDohgmWVIEx0HbRxFnGZSNxIsbYAyxLReQp6ymcMAWN7BRKYhUMwtO2/LjOZSSzp73lFzSEuq29YQqp0qTBQJiHUc29vTRhj3sRab4QWCjDSW/yuLEy25tCJfYZwig1LUnOPMeF3O688=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOIux38+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGhSq2wm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOIux38+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGhSq2wm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKpQM2056298
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=lOIux38+Goiz9v+M
	HRVZtClTNGMpBXMJuFG+Cfto+7MLYOnaJJBQkEM+wb1aZXlIT5vXIAOstdTa6r2d
	o1h+JprGBfPA0UTT5p3uFBro5Uay6VsU82x0kGMm8UIOCGEeNfHQtCAIJlPu4GRS
	4ubq1t4C1EFWY5eD56AgfJlBkStGCj4eTD+kBBLkvb3gF7dW1Qbuh0/ngPND62zR
	hEo8n1HMNtyKA8cESz3Wyi7eiryQllCcDQA4HW0e5aJrxxUm6+tmsOXp5ThRELKe
	cbGlMpTvUCATQNGM3rtEgbpLC1E6c1BlK7m3q+xleU825ZzRDFjSg3c1FYqSn2Dn
	Q9vwwQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv0qwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:02:02 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c83007a11cso448433e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179317; x=1790784117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=bGhSq2wm3mwdCkcpwCUEHK9/P/jqCQ0kpfqRRfSHMZifWb2GfezxxCarAPeTnv2kWj
         8m6T2sDSzZKF5IYzEmJs+nT0NASviQ7DtKEtTs9IOmovUZ7nSmXVmrz2Pph0VkUsEb1x
         XhPgJ3XbncHg1nkOEPGGoYJiOLsAHQG9cfTdOHf20PJJOkHJ9sZ1HhkiUFH/Lml5NS/h
         Dr1wbz26LtJhIU8FtoOxVw9iZjFR8SLV+/exjkXDlfkTnuwvgoA25CfuRmjPTz0DBg2O
         pR9ozyjYjpwAaRdQCWjZiOpC9lO8Dvl+hvAI3FtLSG9Pxtv+VIrmjkINsra0LgaEQuUL
         6KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179317; x=1790784117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=WXwrw27W44y8kvUGF6Tv57VZkMNjhGsWRwPJzJrkJREN3RByhre6KFk+65OtkP11YT
         EUIDAS0b8kYS0qvjhaMAbobBCYm6t8yYKSDKWNP9Vx/pLXQZtU+cjoP53oi9MWwCmHa5
         bDMoE2RdhjGLKj6dZOUtpIyqBJxm+cBuPX28Mfyy3T5SBZbZ0U0edFzjv6QZ4ZxCQKPF
         902E2unLeDt/Mt+WP1cEF0QQCnH32ySaN7k31kyQlg2Pu5j/Dol66uEBdhKI0c3c6cUy
         TDQ/gK2fkbk3yhEQ9QzQAjOzPIwrPbFbQaTMcSM/M2s4/tfq1pEes2zrL0EIbfXvMBfX
         ds4g==
X-Forwarded-Encrypted: i=1; AKwUvBxyJaltqJeSZyhi3pg52ZXwpCBvfz+oLjfgyF70hY2UX3L1HYDHcSugcFzsis3GC/tSK/HF/9qJk3SwmvD2@vger.kernel.org
X-Gm-Message-State: AFuF++mNiBC6zEXE1vpcp0vjzT33GoXazA23MzJ2qeKMhoBlHrhgdesl
	j5f/hS5lxWLykiqnN10T0FtKWrURRhCIAfuvsrdHWG7OW1Adt8gBZDbUaVfu9NImIZpmPhURJzm
	QyCgG/CmJlxhk1nFUQjdERJU3qk2/iVxvucmA2LHd2/COCk8+9ZX5rIHZwzdG9LKcYFho
X-Gm-Gg: AYBFou0JWNDkln8jdaGvN155NSE2Ccy/JvmrIPSzvuzspnQp3h4Klj4Tl/q6+fo6+7S
	KN32hcxdbm0KraECTGrDEhxiEEabO2KIb1J1tFC9ye9T936CEvgLZdlUgiy4MO4Ftosz1UbyJda
	Ryqgvvb0oYXDbsAYT2Zis11fzqxIyLS1G+6ykuJ9ENCgZfMCu99OkoD347LfK9lBFl/70SBcha7
	er2x6lRpKMUlprCSs56c1LqPTs/JDPbmFcsQFq0WBNM5nWA/OSA5xo1NZRTO2NYLFyGWMQ3Ltqs
	DRiAjawd2Cg3KJq9xci+GzYyLbXIiUCmBCx9UOStIETusjmMmQyDD2fVu8o89nIcTeUNKeqJEmY
	XpxO5BiMAetACGWpMUUXhJVDknp2Boxq8gKi7U6ZsR5YRcW6lbo5SMM0mWwrEEjddYiMSEZodN7
	Qc/Sj8JBnvnQ/LUlKW+EPMbERK9lwM+P31Z42NQOLuAufmdOjDeUQ=
X-Received: by 2002:a05:6122:310a:b0:5c9:a618:bbf7 with SMTP id 71dfb90a1353d-5c9f16c5f3amr3635694e0c.23.1790179283277;
        Wed, 23 Sep 2026 09:01:23 -0700 (PDT)
X-Received: by 2002:a05:6122:310a:b0:5c9:a618:bbf7 with SMTP id 71dfb90a1353d-5c9f16c5f3amr3630868e0c.23.1790179246535;
        Wed, 23 Sep 2026 09:00:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:30 +0200
Subject: [PATCH v9 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-camss-isp-ope-v9-9-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
In-Reply-To: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX+lJeg59nywCb
 Fq3ucSc04yB6qKqRaFg0CDFUfQN2xXaEahljLM9U8GbudP++XDNTVFy58kQwGA5sr3N9ktF8LNj
 3TlZE/5k2WWThN0APTSKQq5lnKIBRUbHNRF8IpKUhlxk3J2yvzrnMIa9Mk6iSypih0bx1xHppEl
 wlsDEUEAcH5vLsXasxry7l/Vkk9hovpq7EAvuws1ZSCqqupxNOQqXrckmXH1J8fvnXp/kjwbg9u
 F+aBJW6DCh744zZkaW9G3bevGycgIMP0JB5JVfsQRBKv1ukj/BPnKL7RlTz8iUs1SaWcmDwaEk2
 xHT+B9cPSx3Rzv8fpapeecMqjA4sIQQzcBxBh2EG+hKJs9ig/j+40xeg6nzitmk6h1NMAFWkQEL
 9y5w7do/St2T+lDfn2lWJJcbDG/38nc05DOmtDzM2QsgYae6jjuZHIhK2gbyTy1xlLfCFRBLWxv
 gxbpByLy29DDAtkftAQ==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3f7fa cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 5EViDqaXZhsGwAub1pb6-PfTFXWAtGsc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfXxutLhZjVt5kn
 QPdCaIutYgrse2p3nra7noZxYFESuc3rFa5kiL1qpDyWkrIpQhld1W1VScbtWJP7nS4Sy+YAPO+
 rqzyEpoRmyvGqxPAhKl/d1GLRX+MpAw=
X-Proofpoint-ORIG-GUID: 5EViDqaXZhsGwAub1pb6-PfTFXWAtGsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

