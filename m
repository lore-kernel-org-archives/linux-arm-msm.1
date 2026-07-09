Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E624446FD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622567; cv=none; b=CyufUX6lJNwWODigLcfiVvs1zIpbeogeUc9umiadypQ92gjN/GOjspdNB8/YcrpXZ/HSbyHb0E728VISFuT957Twmn069sUKcPpmRkmaeBgjryaq85U/N2phkasf77NU2WC3WbF1QBVszrSBJeWSTsLa4cbRfM2FyzlQWSElWOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622567; c=relaxed/simple;
	bh=rYZUtLoMbkIwkI8yFMTr/hVq0ZeMXm4yVfo/qe4LXmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDe069swAU11kt/o7Fz/VPsamluFpexN3oozrOehB44Vx0ZhAa++lWj/85LiTtbTJp+s08EnWQmQYidLWhOYWUWRA6gtOt3j5LN6Dnm79NAc7y5L50zr4W6C+jfQV+IB+TdMCRbb/LYw2hDn+x26Q/O3KAVZ1Zfk27JY1laExf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXBqxrOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVQcKi3E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXBqxrOa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVQcKi3E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWrPq2373970
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=WXBqxrOaqkH3Gwi7
	ynIky3z5jsmrx6eW1ol8QXMfbBkHdq0Fo/t1FgDFME6hbvhhLUC3XFMsrar/swQJ
	FOQOjeFamd2ipwcVMyQnGiI5i0MkkINOC2QQqMTb2ei0OMkVCMzWB5f5A2rzC5O5
	8b6hyFb/D5Fic+DbEa/aax+aXxDqQz6Q94skVrr+LfXNp+sW0C+MmsrWUDMntbKD
	lu6cyJWPNtmdqTJKnZ0ON8c0W+wpJA6kcnMcMNvQpTJs6i4ToEIpmO8pAcIhQ6+i
	9ubALVyFK/yMyZ5llIbwQ3/ObPzRPtWItKkS4Y/e/Aj97o/JPSKz+Op0ipn4pbhC
	46qdVg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5gwh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:42:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so188085a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622564; x=1784227364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=QVQcKi3EQ0qaAOcSj3B3OEP56Q3DT0G1BfCnpUID/Ua/KSBPxQqRWbiP4cwMu+GzQn
         SXD+bgfgEG3qa4Q5FBmxR7lTzks7muEa+eZcvqCv3hAiY3A1SYFps4OM4Y/k206iT+lX
         91Wx9Dz9woYTH/WEWIqVaGQuQ2DnIDKiFKmI3bOvCqplxLBt0ob5cs9NiOdl0umIpeNe
         VKKOMM/wDpTEjSROdxYl/fPW6BiLBsIbFD1F1CSYqsneCY7cHDpUTwicBBatPP+YTded
         zGF/FT8b2ddMJAVSRJZ+Ty2nyoPSpifn8i9ucKaXL3lXhCc7DYv7Bui3fVfnPai9yQFe
         nXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622564; x=1784227364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=KFmSDuIU8ttJ1AWAonRWFwlsLvpCjz9CHDQm5s4Mj9narSxyeZ1z/GsVFF4bd9rqVw
         8a8ohhVABZ06URfs1OswCCKrfTr4fg2kfZ6BgPyck9QcMJSoG1rOFAXmkqd6C4r6t6Lr
         1ylIN9clKFOFHT8JWrZ9jDwYgXOPDRKjSSrE1NXJS+++5FNoIQgRq9OhPEGLjcGXHnCX
         M5Xj9VGJ7x1hLpiepLTrl6CzycN3f7yRwa+4f4Ve8z0LEMomsP8q9MJxLVmQEoXSmVEb
         lursCVNF5g4CtTCZeIMb76tvXWz1uMBzdAakaHXk8pWszH6HJzG+BVYBUBbpU/3QMmkz
         WUUA==
X-Forwarded-Encrypted: i=1; AHgh+RqdZHk5Qrw+54lwMyBtq0xdJaQG1k5dO/SxsAFfNIn3EPsOCc+Nitb3pf3SHPd7kOHJSkwJG0dLVvQyJFYX@vger.kernel.org
X-Gm-Message-State: AOJu0YzBu0QgYP4o3YD2qQgXTKEo00tAydxuQKeDoqvJpPhVvkFI+F25
	yYLlpkG3nV+HPKNSdafJ5ovczDG70uUXHxd6+X5iZHxd2vtziS4O+UgCmQCpws2OsqKogOcZBqY
	gSEZ4p7VpNNqQGc8+11XRtiGhiLF73eFmT0qXPaQFwk5Vz2HNgPePWQYG5fVOTXW7O4We
X-Gm-Gg: AfdE7ck4gqQhDXRN7XocJvMl7waLNEeSB1E4kWi0VvbUB095MAMU0Kforg18i9k1R7i
	hNEcpYTJd52FXT7JMeBIvN0kSnvI5MvaB7jUvcn754S77k+57Jz5KAQXKqazI7uqyouApRy3Bb4
	gpXRTf9dozGS4XvVGrx5hI0GXhCemfhxKeMcZ9/VaV0pSuzH60JYoBZajdVdEZ/Cyi+X5Rn5lhe
	pGntUrzRpVdGm8mZMmT0Fx6jTBYdo4+j92aW6EW5KyktrSGO2BCgyc7iO9z0ekULAITr/m3fvql
	2dqWcYGQBTVJNTpth+VCjTucuyW1sEew6osznqbXlxAtUzaEMWenF0Q7H1QSsB4eO/C8k5H5KQg
	oDQGDCb6wKfIY9cIVtN89ZbKBZVkAQp0gSDg=
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr7852557a91.22.1783622564140;
        Thu, 09 Jul 2026 11:42:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr7852522a91.22.1783622563682;
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:01 +0530
Subject: [PATCH v6 2/7] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-2-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0reXjU4841qQsB76OT4bfKmGmY/z//RRWVRYHDWGzM=;
 b=U1bXBRrZl0X7p4f7phkaOBLRRIm0dBDAxAxqeraekRPEoZjymcovUAG/9AJRQPrN14gyQCzS0
 cOS+uX42ydIBnzzAcoCdQhe1IOFCJGt5PmboodpVnhVnhZ62hx9ApLI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a4feba4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX5XoqUjjeKjKj
 lAyHga7XKgnG2SoVLWDgYqRGS1eSdkyoOQNL7sKnG1fPm4XIiZNAfxQkhn4r18vKVdq5CoX4wal
 u845Xu+xy1LQkHWdQVoHd011F/5IeYc=
X-Proofpoint-ORIG-GUID: lnLe4FbQwmVxFxsLvxj6TycVi85fDRsn
X-Proofpoint-GUID: lnLe4FbQwmVxFxsLvxj6TycVi85fDRsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX0Vx3xrebe1g0
 vmIBqYHwRJje/ahHrtejkngBMcTMvzyX7KoRdH7epkj0PmaQ/GRB8cKCwIF8joj976XGIesWq4X
 JkdrVFtQtw5MyvTQFBcM+hPJPv1gjWfRdIneWQcaJDHpf9RTKopyt98ktBkCfcPhR12BUIi5KfX
 8jyp433tWz1rOeJ22ObLwpveykfLqO6GdNAocZtbbYAyvjXqfTTN92o6FpoY3wAD8PQj2RsINuP
 +E2Z02rXknCqg9xwzDtNBdcDkR4DO0vrwSFhGZR0uFb4HhrCUx1d6p2k9BPXNOR+p2tW2KWaSSE
 iPcuHN9c+zcfTjSbcc4GvFYmUYv0eCVJgvDvY4G2Us95Ib6HCUmeQnHZ0yzo6LrGRMqXRb5jR0b
 ZAA5qvCLR0Npz0qRZ45v6JaAPfKSK6VGDR3IZyz3NBi5vgMCPm9VLjR3UjBDb1ZGtvjg0UAnn0+
 hlL/M5oMRxipFfZmXbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090184

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..8e648bfb3b23 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -353,6 +353,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.54.0

