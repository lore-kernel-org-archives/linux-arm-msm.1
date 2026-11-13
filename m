Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572669;
	b=x4zpzQk2HmPZaaxFrpqueuZLDHhPxbJivmT+tdDlM0OdAbUKP10yJRD4BMXVDOWcYWLf
	 8AH1tRVJ8rewNvOvEikmvclyWAuhxA9pzAKrknWuJzxer1lA2JhntqmGiUJ7L/umzymFu
	 Peoiut9rD04yYj0c77aRocDC/FSWV9CVyIJz8zbZnPraY/CcMNk6fHsKha6DxbEK7Obas
	 abyG5qdhXkqQHXu0bL8fZPHl64Fjlcv4VQ9pTLdD35Tx8UI7MmJhM+eFNgqEuH4ypA85Z
	 tLcLhPEX1S67yxXrfBZaU8k2O2wOPHfFt5cVfkzavp4ofWf4PXWBR+4vkHjtP0/vUHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572669;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
	b=NTgSN1GCAMRvfUWHBhlXgu5ATUyIaGt7dmBnA2dCtfWWQ4rFnRUVdik6siDmzHQrbBlo
	 9K9pSnm3aPhrtxBUzj6UdDLBilz7AjJv9uzL2CmiFAlBuLcTnu80HNk3CPhtLrVNDxhN0
	 2HJJfxvZlx1uSyiA1dalCR0Jy+of3NgGw0XSi1NsbwADJroYjuVfmoYi2prxDht34AhDq
	 UmiYfbe57lyFb5rlsxp/S1o9F1VBJtK2KOyHdMDo/ngUFFr5KslmhctWwp/eUM4snMHGc
	 enS+AFRNiJw8f2woEkmZzmel+uXrWEEQJJErqe9OPz/uzU3AMs1DMXLKVy6GtySu6fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyQkST7o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gzYttcDx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340E760A3822
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 340E760A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyQkST7o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gzYttcDx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcwi688976
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=; b=YyQkST7oKc2WT7Pj
	TZoWHWDmlAPaolZcs8yXyqWEYxIkeQx9qbwqhrlAgc4qXogj28cEWjcUT6i8GqoD
	jcpzatO9oCm7ZO9DDVf+Ezti6kjvyHKKLVyUv8qo7KVbxy6Mp3OxGlAYyMSS7h1k
	qzdStdJkcbf1KGWhpPqgKON38xqaEpxzwuEt2EjBiScoNMuqebhjpiEbDVUTYIE5
	v2neLr64JhebMzs0wKepJGPWXnIadC5TR7rBgD9u+2S365F9va86t1TvuDQ5BPJ1
	1qadSl3jpiOZq7qDcHwz24v5LnT00m5i5J2OmWBbzJ79m3DYEEuYgIQ1o4qhb/Me
	KAAXMQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufj9ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:24:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb8e8bccdeso478035a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572667; x=1795177467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
        b=gzYttcDxpcpUg49YzOiBplA8oG+Or+4U5zT72aGuG/wxcKCz+bRtiBvyly60VBovCt
         TjKa1nQ2Abx2ltQ2/J8ZyVTmYheiP8UFXV/u9yt6fZ+qmP0Wgu+G9sjsDusctQh9MFjh
         nZmzAhQF1UTT/GSW2iYUIsGxOEWREcR9hLM1k+t9UefnT2Vui6uR5e9L3B+7ngJZeCg5
         /tvBBNX0Fkf01tsRWpjLbCZX3vSl+ypqGeLHGyvKtdXFFh1u4E/Yibbm3KBRnZetYI5U
         JCFjOGl6TD0GYTGdOSlDz4rbyoIRDtzqizWE95r9GOakwzDlvifXIw7nGT3nMvMksN31
         Mpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572667; x=1795177467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
        b=sbvkh+rHWQBGrK3HS2DAbP3BqVJuvv49zNgdYo9MMbsFr5hjGqQrINK1LaOU+E6TOm
         wM6jF462SvTX7GJfUnyGKFjbK/eKJJWw+TjRftZKnPh3knz6+9myNM5Y3G4nnehx6OKY
         O+owxFZWDG2/ppvBBFLJQ9vXjpqzLyjLlvA8/jvmmaA+p7Xx+kGgrSksjH4tL/khXu7B
         KkcYRj+JcFLwe9zJZgBkDKf6DYE3zjUBM+zrft0R+ulbOoGCQG2eTUJTJC8y8zepiaQD
         CDFggOm8hL9M8b1V6gQY/nV0E3EI1L5B+e33Y6gJKRuUuS6KBzinfrVxmTcubzlNiDA+
         bNkg==
X-Gm-Message-State: APuU4Z9rZ48fp8ZGXJemDZdZH/Owa/FdvRnoLtY7Jn1IKZnPYbyt6+E2
	dRGUdDug4QtmIjVzAOlNo0VmpX8ODBXjnpU5uzZoiUjtuae5I5sIr6HSlNhnBG9+2QQBbVVpy5N
	3Rwr0k3kWWi87AXMyRZkWtZhhj9tleb9na1FiZuU8ZtJNBCZsJ4f1OLkTQ5lQM/bRsqWr
X-Gm-Gg: AYBFou3nhtvWIUowHsmcYRwBtKg3w8wbuZNa+STQyy0BbZqwHhvnC95obI9Lh9r+1zP
	vDmT998W07ffW0dBrIPLtjcfRSmWZps7KtFTZuI/vHIb5ywj/jrP0akR+IX8r0+SmOSA1ZNcBgl
	F+Lgvyxhk0maUatE7jIlfLiUEqDT0MPvKauOfgBgG887wF+CgKg0/y69xrw1rNdvN9vvEP+QDVU
	JxzIahMLC78Q5LWV66f01u1l8TasSKAcEBJ3dvLfkL7J16/X8wDBFSha2mSBQ5e/910B+Pmd7z6
	yNLZ9/rDDtzyvsBVfAnUNAT+0MTka2/p0v6KvJVv+ah5rXkLrgHPX0rdSO15sSIYSzI1u/rx1MA
	3t5oqRKKYiEqczLBzA6PAsfiKeL33zkARUnvOIqmLq0iRThlOriofIKKOMdN8BBbx4+5YDZWfve
	2F5DUUSR73vg==
X-Received: by 2002:a05:6a20:be8f:b0:3e2:9025:5c50 with SMTP id adf61e73a8af0-3f7a72ba21cmr2200511637.24.1794572666826;
        Fri, 13 Nov 2026 04:24:26 -0800 (PST)
X-Received: by 2002:a05:6a20:be8f:b0:3e2:9025:5c50 with SMTP id adf61e73a8af0-3f7a72ba21cmr2200484637.24.1794572666380;
        Fri, 13 Nov 2026 04:24:26 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:25 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:54:12 +0530
Subject: [PATCH RFC 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Allow 2 IOMMUs for Nord
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
Message-Id: <20261113-nord_embedded_el2-v1-1-48f717e97066@oss.qualcomm.com>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
In-Reply-To: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: FnpFuvT85Mo5cnDxh8EibtsE6ldYsou6
X-Proofpoint-ORIG-GUID: FnpFuvT85Mo5cnDxh8EibtsE6ldYsou6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX6m7jecHXKSZK
 3oDeTvSgjLplUBXI6jmn12l86/Q7OWubvdK09KYqffnYnlEdSX0s48U4Xio+COEYIRWMFvnE4/J
 45eUZxnLcQWTveUTiR2il1edJmFmaDuW+9rk04i3iIRh+Q3cn9NJUpGVIsDqc1BTwAToImpF6EJ
 X7CHR5AUwOwQ8TLeZU90wi+Ik7Ho9qoYG32RP9Q/W4lhuHJ9Q1XImV1cJSIjiL9/e4wNqhqVp/E
 bAsLqe3bkEk3AdaldH/DdlQz5QwGgZyjLUhQN4X/dMsy7pkdG/HVJzu9hrkjVOpMt6X0wKVKc2Y
 YuDWf7pV+6/HSR5xAxHxZFkMsbDPsNiswnU79FIwUGOl5X6EgQMIH9FJosqUdxudzsdh+xTP61M
 Obl0aaI3GkLb/Z6N7W7kPYEkmj67jV4xX/sySQXRB1FIM/jAngI3uVz3Wq6C8bc+fmLvqy1PaIN
 DF59hz9hJJSLJwdm9bw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af7017b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=K8mYBIOISTU-6_9uHSoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX++txnMg2RPp+
 7L+nYJqbBhAHLGxtq4eOJ9sYWl+Pk3ohj6QmAlTSSH6c2YC2ZQeKFArAkMye+DiqRUVi4UkAtO5
 iCAaoGLbT0Ch6YqjK1FQENSZ67q2cek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

Nord SoCCP needs two IOMMU streams when Linux boots at EL2, but the
iommus limit of one inherited from qcom,pas-common.yaml rejects that.

Drop the pas-common reference, describe the properties locally and allow
two iommus entries for Nord SoCCP and one for the other compatibles.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml        | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index c1911124e073..405291c769cb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -55,6 +55,10 @@ properties:
       - description: Firmware name of the SoC Control Processor
       - description: Firmware name of the SoCCP Devicetree
 
+  iommus:
+    minItems: 1
+    maxItems: 2
+
   memory-region:
     minItems: 1
     items:
@@ -87,15 +91,27 @@ properties:
     minItems: 2
     description: The names of the state bits used for SMP2P output
 
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the SoCCP.
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
   - memory-region
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
   - power-domains
   - power-domain-names
 
 allOf:
-  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
   - if:
       properties:
         compatible:
@@ -111,6 +127,9 @@ allOf:
       properties:
         firmware-name:
           minItems: 2
+        # Only Nord SoCCP needs a second stream (see top-level iommus)
+        iommus:
+          maxItems: 1
         memory-region:
           minItems: 2
 

-- 
2.43.0

