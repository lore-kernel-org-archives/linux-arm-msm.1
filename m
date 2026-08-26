Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F243EBF11
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750784; cv=none; b=iZsDJxdLznCB/aTJ61iJOMhWpYisWS5+2nvRNFSBWB1g5Xefw5bw+Ws5eb7dPkIcLgIp5oCc0U5Bx4LTMfLX76fjY48jXnBCvEkDGOkSsF0w7WPHALVg15jUzw4NAe79fT8C8VYm/6LLQxT4k3R6ooNuuz7hhJJy8NbS48IwAAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750784; c=relaxed/simple;
	bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fT8oty0nzHkBai35GviyquU7ZmztuFknNZd/l3uy2v3dsqcnhElj7/apKMrQ0FSrA2CA5DogpyO89rCJcesuX08sF4jF8eTDDDuEZvgZ9AdGRBETJ191Z+LpDyh2SbJbY+J5aRwMg4gm+8xBn84MWdQiEoHlc3u34JeHKdqpXPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsKk+H57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9inNDwx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsKk+H57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9inNDwx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCC2ct768360
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=; b=hsKk+H5771OI9it5
	He3g3qO48bKWwCjKTk57F13lpBTMKXDbRsry1qFscqo9CQORgDq96B+L/xt29p+p
	KaCUQeQez85fjB9H1sjmt8vYsYrwk9ThOSiW/ZmSm6KNk5DgMg227B4LGVQMu1vO
	VNumkbXgSynlrKXipFBhY7i1v0Ex9EwNzt38x/dhE8CB1Gqgzz60CbBigJ9UoNNP
	xYi+prkWXzy3YRTdKb2p3S3OcivPceA09E5BN193wQRLt/DqMoTraEiUDedSujGl
	xJ3y670j4kTl9kWOfvgluQlzZ4iXmZ5q/PV/JXJidtTRkrrYqDIEChxwsDAlPZot
	tE1Ahg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n0qjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:26:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1613556a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750778; x=1788355578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=O9inNDwx67oxenQeA5NO4/UQ0/D3uGdgL1nr1RKSnuyXwlC0gwqB4tMQ+iGH+pFE6U
         r/X0/4YZ3ATg3rZ2Q5J7awns3dHx8AI9hA7GeDr1Vk0mtIZATfGbEpE7AkVdU+QW8+IW
         oOyl05WNZ+xQyn2s6PCLfQE2ItWbwyB6NbouB992pN3i/lvEwLUgL5nkuZeuscMoxL/p
         1ibVO5hZzCrj5xMw7dogmmYaRGsrqsIy5VZ55utqNBn5lo3XTt5iyx7A8d/BeNqeC6Wt
         /LBnsEzdt7Fj2iqc+mOd3xZ1z8gN9IB2p9+40KUcAXEY/JVVBesmDska1eYmk8uGs/ar
         7H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750778; x=1788355578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=BT/UwuNbX4NgTxwKSvvHvkCTQB+TToE47QxLsRWYZ3E8kNWraGomm156nH4EAZ051e
         ALKyugP3lk7N2jQdQ2MhQonGNdoeLzbamedDSCnWGTHFd0Jzjo8iB5o4pvlCpu4urNtT
         6qOVn47ibutLz0U+md+Ez71yvtR8x8rGq27zBHqjLqMt9SyYyLtgemmD487y9RNd/UYK
         FJC3ZsAUcw4n5BTE/keSar+paQOCMX1QZYwAdaXbpWWQjzGslExt2/fJkWCUQfPZMEw9
         UX8ekUEPIWK5c137lI2rLPsSsqJbFUXGK77/YVwKcPNOmV44HfpWYyvGWtMY1c0U18rx
         AGBA==
X-Gm-Message-State: AFuF++kPXlrcCROvIHS8WtEEt3TZUHlUlKpp/iaxBMbEtbKjYwG7REer
	SwPlfRcSuE+VOMVjuSWcOc7no0vhhkyj9Lmfdu1gRn2PJGI4OnWww194s63uWDi5OeXVMk7bgsy
	Cs0jzpg7d0Tu4rzymcdOn2KuG8uasd2I4z36UwITnjmjSgqA9/U3MbCzGZoMZbZYW3RHg
X-Gm-Gg: AR+sD12Sas/X6RD9a10FGAhlOh+pADTX2C3mzn0RAolVifgFV5yUEu0i0zjqFJ77AmU
	U3FIUJcXv+mGZqoPIP4lR6n7TAAmitFy6sDCM+Kp8H+xVPVgWuc/nYLkd/Rk532tilUti2obIKY
	c+KqPvhPSxw6qaJj2Bit7uTir2xjimQ2HjmZm8ISYTLCMgRFdls4YPaVPCFSf0Vigv0cvhs+aDY
	XyzzBDp6Kg0tfn6xMthGeyQLxMdIa6FB8iJ/eSM2JxL6MGoD957tVAJTpeJD963MP16vPGENgW2
	Vsgxt09l3Wpe2b8K6Z7tYs72St4EIUnYul0hpYOMucFpqmYFg8wA0qCbcoXsul1koH1ilEsmdpz
	a0Rr57kZyldE28I0WcIJhGzM4y5vHXh8W2A==
X-Received: by 2002:a17:90b:380b:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3966d13a242mr13700644a91.1.1787750778444;
        Wed, 26 Aug 2026 06:26:18 -0700 (PDT)
X-Received: by 2002:a17:90b:380b:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3966d13a242mr13700517a91.1.1787750777930;
        Wed, 26 Aug 2026 06:26:17 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668767d65sm4581108a91.8.2026.08.26.06.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:26:17 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:55:51 +0530
Subject: [PATCH v4 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-dup-sessions-v4-3-35555d2bfed4@oss.qualcomm.com>
References: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
In-Reply-To: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787750757; l=1160;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
 b=hKxSee3N2j6JpSIoiOSL9OI3eog6VQciN937QQPsq8R6UpGZiEJT1MF6VHtqLnTOd6+nbzI5I
 NdgVHbZYUk4AbjVTUiUcHFN9x1kRhlDqJimg15aDP30ZsTFUanOgEcJ
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: -J5wajxszau0j83J9L_sJxAbPOuGd4K6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfXzMnKwIArx7/R
 04c+KbcfBmH++mSzr5tJw0OC/CtIsu+RuJ8x5d9bv/n1uXx2ZP0SUW02e/uV9zUy1FeqJJ1CUNX
 /Y2visGgEY9yjVYd+DdK5ceRVkYY0jk=
X-Proofpoint-GUID: -J5wajxszau0j83J9L_sJxAbPOuGd4K6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX5PaBrBwgJKhG
 tD0+X9hvzNlfqsV/zH50onmpeX9I37zYOPaTk02PTFFG/kdGllPPqa+/qVPN+VXR3NM8K2cFHSL
 rPJ1DUD3sZyj+PI//TBh1YUdopli9rfBez8YA2Ecs9ZC8mwrGlkTgPsEM5ejUJNLEz1tbR/mRG9
 oV2nTUMGdlhkiu4gLUUTtqjfSWQFU8VSaAN/k122LhpuG8pAOsJ74yNha21O1Yt4VB65QUSD7nN
 zU0vs3yhnlwGa+rOiwu7JwnKcGnybsJxcaFlVTO1H+4oq33RbWOROg43Gr8LQlRUTl6+xEKKQsv
 boQ15c7xrXluhVvZ/AWA9pugxmLJAWSWicWksVLUl92H2ZzTkeAdP2XF9JY9ZY2poNtw9vOiPJA
 OCQKO8VaefL2jlcTT+XRK2HQd77SV8tUI7x9FMPGvJ6209Hh/9B1WBJzYW+dzDXwraKDZ8CXLlC
 vb9vCJMb4MqLTWBZulA==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ee97b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260111

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

