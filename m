Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEDD4ACC75
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 20:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381839; cv=none; b=Mg0qxsVLc+SOZTY+ISg+MYXuVaRkwHApC8e2Si9+aphVP6t3vcpw7WhydaLZMNdAVZuxAv6JA0ITpdp1jfDw8+/7khGjpEMP0+bgkFU2HU9PhoiRYn5bL3Kl+epRO2JU23eNNlKi34yPZ5rqnsjUQmXoPZ+N+DjQ5ODip1FZIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381839; c=relaxed/simple;
	bh=S1OTlqKZWIb2bXyBhFfeNBeUssHFULWMwu4f5hK4JhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnExSkueZrk8GRgRfil0LRrt5R1u0DYLwxfvtX3wgNJIWnVvy23c5QoZQ38hwPIeVZa/DxCxy5i1UuzTsRZ8aJtbBuYpqTkQTxrIeLg60vpj690lYnlBg8SyN0XfUUVeuJhs8vqnzGYkjWcxYuIek532UhONMuk5p/pUqjaiIEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WC6cnACO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4KgPV30; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WC6cnACO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4KgPV30"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH2lh3288558
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 20:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vjkvx5+Dov7
	bk+0KCz7gsKQ0yLzwHYGcRcMlfcp0IIs=; b=WC6cnACOCxyc4rECMNdw0abjDy/
	sftzbPalHPL3ebSDMVskK2/TX8eWLrw9Q17SZ1J/sMj1pMfh6oOoTLj6PpfxlLYt
	ef6xfxMdbkbzE+XnK+jdnlBDFH/yyjWdwYgftbTusQcMJ+hQPANl32ELxaGvnnh0
	5nZbnLQvDdEsoOnxZelTDZOh/r11dzmV8vCOs5Y33cd7Pt8TCytZ/OPKRbo7eNID
	KKJz/hNDEqinl9GFGKcfSohGxVbEl3Fo+oc4JAf2X+ZqLOmNjkRW/0GEcNuEWm1v
	1+10dRQlsUJUgyXY/RPXVr4GF3QtZuL0WdPyJcRAl/a1zdyU+C+gJBoNdRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8t50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 20:43:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so2157166a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381832; x=1788986632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjkvx5+Dov7bk+0KCz7gsKQ0yLzwHYGcRcMlfcp0IIs=;
        b=T4KgPV30YTWNmQHLPv/Qs19o4uMfa9RzKaPUuqxoa8xmuJuG631R8B3W1xfHmjGGE2
         ou8cYrvbqhNojsJhHuIVFZ/aczuQWcIBJFrqXx2G0RbytJ/ECkxGzFtnE+j+8qZ5lvDn
         OSdpx1ixlDH7hMBpxiwUNj9HvCGRmS1AraT+HkSvjFQO2ID983Km1xHyF+aC1d6viJf/
         kufXtx3N/zZXKfefaKeP9t5e4eXgQSyLv5ls2qt+t2y5npCrx/caMGusT5XhQBFNt8NA
         pKd/foKpdlWmpcC/ct/WvjMrHKO+cLl0/ofZijOpbJ4bSzBKRGIqxAbNFOYlDf3ao9o0
         kVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381832; x=1788986632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vjkvx5+Dov7bk+0KCz7gsKQ0yLzwHYGcRcMlfcp0IIs=;
        b=i9PULObQUSLlmFgMLCv9mWGmkPSoMwRdC/l0HSPknu116LJjuxbH9kJqhr6TQlkJuy
         vsOdQlDxQRmb+clTKp+aKAqaj0Wrrm4LLJSfY/982QAUNpiGod/UZ5A2AXWCiLZB62du
         Xv3TC/3JyGkV5NVoq7FVKc34JFtAAqNeSuaRPlkIJ110ek+hOUWOHZf+ZBb28unOKgO+
         bNlBiHQUdgozFtpBsqaznKVvbrXODIpVI/qh/fPiYNV6HawUVeqn9x0e5QoLbRhgNKdK
         AmYSji4RCJ63Rde9YMjbVhhtFG5sdeeHGVsBzxcmPwPW3vq0W/s72n9GrHGosPMjFmLl
         8u9w==
X-Gm-Message-State: AFuF++nlGn1QEP6ffflyGcDOpVkfHdQ/fX6c9ZwPBffVRiP2w8cTIZK8
	P1pGhSQs/HctzgdggoMVnbU8+Ap4sGntTHwG9YM0GUBBbnYMbqNpDlumCaVnRvHOUZ44XIZNc82
	9D+U+Zg0oQHZACXeOjfTBoJKzLVP1zTz7AYbvhn3yLZT5PJe9a2AJJpbOXxF6qmLoBucG
X-Gm-Gg: AYBFou2tlRQngHvTS2SK523zUjl7hUlGUyRFKRkMARuSj5JEPCue0e+Zf4c2AiUJTCr
	q8jQZdMBDOcLsrS9BdJjXLM1gTJdp9FfltMovRaUClgxVgr4kO6G4uLe2ADIfU92vbz3n44z220
	rAlAhOzaZCVVZdfX5kWwPcSUqP/4i16mkfAwnqJNZf/hE4ysh/EKWa3ddkYo4TS6Yd9UR5AkxwJ
	uIKXYhW6b3mpuuUm92yTDsPkgm5sqjY42/3ctyThd6D8rIcbSrwHeivJ+BH21dVQE+jxTAB/zlA
	f2kHyy7wwlhZG/xVGQ+078/+lamBineYOJevlVAG+PVv0RTGj5QUqAHobBA0kMAz/PJUpVJ0pIP
	niNIdupq73TKTK3G6hJJZb5Obf5g=
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr11376830a91.14.1788381831519;
        Wed, 02 Sep 2026 13:43:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr11376772a91.14.1788381831013;
        Wed, 02 Sep 2026 13:43:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Thu,  3 Sep 2026 02:13:33 +0530
Message-ID: <20260902204334.2061226-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a988a88 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kGc2aUUJYeWwMdlnZD0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX8h2c7iUzcv/o
 5N+X7RACxJVxHFh/bcB6pzV0z39S4G9qQDp7x3DSrJ2oCeM2+72VIJSPXgUmcsHKSOB/9VCmEKZ
 SJ/r6OhNZWmvpHaRARB1Z5E9oTd/j44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX+YbFcPBO8nxC
 LliXB1jVQlBuAimwiJCX0GVtfCCwrkNMHvJMV0srVQPt1hKDA1Tekcl148DT6ZGayUCilsukahA
 4qIChx8Mz6BUfTZJqBAdVrfXxrhKvQK3KpBRpbKhZ2sWAWyJPZEFkcugmEaEjeZebMKjt6LwZHd
 tsHJ3pzFJVJDGfskI1gfH4ggXABpWTkDGIs/cX0erNh5/wVrR19o1v910CP7OiTkFS6KD1OiPka
 VxpK/nZyreD8kZ3TQdEcOnanboLEv9Ym/LSO7vklpyD61z+Tc4TjI/miFImJM/JVbMxneEsqW+C
 yrLjdf5YzSjs5LXt3dvjnc4VqkHiTHbMhq1eqhPd8jt5UUo5udDPkC8JGCzPtAddkOYWGGlEVYX
 9aw5BRDuFI7nClN3cpHviaHdAbFfURAC2bLUnU9GYkOyShGNsNjQej13aDnaY+uM6Fq2C4OMNCZ
 Zg4ln9kk82U4aZUf0TQ==
X-Proofpoint-GUID: ArrPBtn8_2fAPo9BXsGc7UpN6o0fhfGC
X-Proofpoint-ORIG-GUID: ArrPBtn8_2fAPo9BXsGc7UpN6o0fhfGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020183

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index c58e8a6c7fe1..cf57095cd49d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -40,7 +41,6 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
@@ -273,6 +273,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

