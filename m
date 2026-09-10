Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4534448EC64
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052834; cv=none; b=BkaAeJplzHfPJxYxKlopAEO9G3XQl6hYGqIXH4NPWPthHgvA3bk47G1vKXwpdh/6zCKPxe50Oh02QZR1o1WcMExUh4YxS9Kf5S9sJVzPOBAUbaincBO/2+SGEzndpcq4YoucHpyILz7EfXxCFFxvC6Q48uQ4jMlkOTayHCqtkkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052834; c=relaxed/simple;
	bh=IoRE54hligUVN4gRAMILtyfQYGutGB4mIpeILT7bp4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hB5WZoG3OwZlNKCqiOJtvI6/ICxylYkUN8dYD3IpCY+90N3XEDzusPmfcaacbL/c/Nu5T9M14CuOZRsac0BXL6r0cIffHnKTnHoujLPUIegx00Dn72sCTXxAt8NVJf8r9jKpvSURaaBptYQUDAkwc2xsw3QpRQbbbr1yfI6PHCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYbUw7tE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkwuPD9f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYbUw7tE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkwuPD9f"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF556l650750
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TtYH6OpyomO
	PlQjGIp+EyoPVGRODOWoTGcxWfigai80=; b=QYbUw7tETNC97VhgOd7fxNH1u0O
	/EwtbChwr/Xcg8IP3g3NIT0/x2y727fuLbzXtM7nzyuZvZNJb+YyXqWA5ciUUb0Q
	iKiwqyHcnd2CFx6lFsYZOPELZj/frzHqK7hA0sBwI7LGEDtbvUnsvUwmNQXdujjD
	czOiM2Tyc+hEwndu1eeqyzDv6oNzoDg3jUzjT7Wz8s+YLorSckq8zaHxLcrXPfDd
	dIQ7sT7BDYnwlEJPLlOx2huub1DvN9/bNPkJReakF71szmDHFGdNOni9BbZMu54q
	1xbgDkuxVFcdKwq5cc8X8WTxAo0fs3sOyLsrtQInHS6H7JhmyWMQIPCRLGw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv78140-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:07:04 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso10844931b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052824; x=1789657624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtYH6OpyomOPlQjGIp+EyoPVGRODOWoTGcxWfigai80=;
        b=GkwuPD9fLYqQgp3rUvTxKsJD5oXlHO+/BX9IumRFkRoXaC6SAO6FrpGALz8Gb/UP30
         aP5o3tvlC/oWElRdT4QZjyvHIGeEesSvPLKyLvgrIA2njMzlPnVHijQuINxR20CqDzrM
         gCH9xD0GmcJbNSf9JDxVY/sluQhaHKHsyMdcuHZ+bxZVScqUBEwbW/YTDAPJd4mGCklR
         brHVAMU0xwEgj278qhPY/a3R8SNcT29jRTEXX/a0mws0cJHkeU6YHMETEDplT3/n+6BS
         yLdEie98TSCk4iTzU4lqKpjnCWWbTA7YgBOOk2PXDv7pXipHe37UsSvE2dVhxJuRMetq
         uNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052824; x=1789657624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TtYH6OpyomOPlQjGIp+EyoPVGRODOWoTGcxWfigai80=;
        b=RB87RKMb0/PCpz/32lEts48DBVYeHLhduv8QP89K/2v9nn5xX6w1YK9G09Hjh4TfGa
         ema6ZMrGikbUQJ++biGerYfQU/wuPKV5UxAk9y2r9ij2NkEN9Fu3AJxJJqBcoF8KXETT
         uJzROA8Mc6q4nhoOQ/pXQmmn5+76HD/9kH6p+9CmL2IiRuRkTseUDqehqIHF2FwufVGk
         b221wzjjrGCv3cmHy5zsFst1aLcep1CxjNQl+JQFU+KFp8fbAWAsmy0VfTuTIJz2K9th
         5+tkB7tOx5I7nHQK7IIGp3MFebgX0wGfdffR+8MUoiBw1PFv/+dbY6XGzc6mGd3sQGnw
         QcrA==
X-Gm-Message-State: AFuF++lPhHbbyjwO+f8os4jdWqoASv13DRO06K+xOvSELN3f57Ls2xJF
	h/8iFBjc3iYm4c2hSdoIKAZHoq8hkioI7Aupegi2zsUyGrnxeuaw/UVl+qiyIXJU1n6Y5raA0Nd
	qJNMgLctN3MhbrDQw3dCLEbSJwu3bnp4zPvqT38h/4S6BDwt/bwfDOWq7vPLqa8YwCXOh
X-Gm-Gg: AYBFou3Uq9qVoCBC18EIwR0+VI2QCqMIQzpwcHtybUFWOX0Wiep8E1GutwHCr5nTtz2
	vJ+BFj3lmacMPlRrIjdO+rrgCp/BSBtR/aO5yiMhprpZdLoYuffOdD1MBUuBB0KP4Hy6Di8dyFJ
	3VPbJm2EPxC9yp71x5I/ErTAUK2HXKMJFcesq1gG9zoX7XEHB4929adXM37TxrzBPlheupYDYq4
	mIS7l68ez6c+pK9I8moiRexAeUpfGMZ+In5j5fnVJg2ozmU3AUvsTILx+PL1AbctXtBAAn/HfAo
	9/kxEloPzKF4hGP0x6z/sv2ri2KcVjwLvKzqA1t3f6QjxXupLH4bW43dBexRch7BCxVzKas0yxQ
	2MeeC0WrMeswycP98gMF9EHPg3PE=
X-Received: by 2002:a05:6809:24d:10b0:4c0:12f3:6007 with SMTP id 5614622812f47-4c012f36474mr6689084b6e.4.1789052823974;
        Thu, 10 Sep 2026 08:07:03 -0700 (PDT)
X-Received: by 2002:a05:6809:24d:10b0:4c0:12f3:6007 with SMTP id 5614622812f47-4c012f36474mr6689016b6e.4.1789052823389;
        Thu, 10 Sep 2026 08:07:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b97167bd69sm19340773b6e.13.2026.09.10.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:07:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Thu, 10 Sep 2026 20:36:37 +0530
Message-ID: <20260910150638.3270162-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
References: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX7ndSXy0BrXGS
 /jGQaMyJ1v0eQ1F/pXqvnib5YpewjBoZQiFp8y4/0ZlzouP1DNTigIdZRW7O43VPXE3FwMMiozu
 9jZ6zXH/dQZHNC1abZEsnht02tOMrUQ=
X-Proofpoint-GUID: PBm3ffSeuUfrGuAAkU1tYaa84zSitG11
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa2c798 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nzVwBEjDhxPf8YtRev8A:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX/peeo0WBeg7H
 bE2l/HZTJz3+gZAzlIv9vYkA3e5Snf9e3eMgrMK+IidTudc/2hvkmZw3+TyclwFPqcVpPecRij/
 7VUYlDi1SjwrLDL9A2HNdgOrWWDsSanBrbwUKr148MVbDFHVZvziZSpdM2GOB37S2NVAlHaNZir
 UjY5S1SocAuq0TCi2CumcloVC/OGjYozlDMNMQMYNixddT2KrRj7L4qoPUm1IL9esUJJBUxYp21
 +vxY8VqrrOPPnM/knVzuj/2NXW5fLbDHOh865zQttsetu9cty2deIuRSo2C3xeNePzPKXOg8vB1
 aCHkJU8WbAm56mKu+DgOH9Ix2KfwOmSGkMik48JC0BPQDN9e/OUVUh+yVwem6d0PavF8JV6mFZU
 1X6Ww7iqyWhpqRtXK6KSbVXZcb6j6JBofgQpOu0ZayXWzX8zgyL9Ro4ZXnxY9jDNlL9cFe8VctT
 YI2g/D6OL4jCxIajftA==
X-Proofpoint-ORIG-GUID: PBm3ffSeuUfrGuAAkU1tYaa84zSitG11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100182

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index f722c55aadf4..99e9aeeb4f62 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -27,6 +28,10 @@ properties:
           - qcom,sm8750-mpss-pas
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
+      - items:
+          - enum:
+              - qcom,maili-cdsp-pas
+          - const: qcom,hawi-cdsp-pas
       - items:
           - enum:
               - qcom,eliza-adsp-pas
@@ -39,9 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
-              - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -278,6 +281,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

