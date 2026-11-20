Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172816;
	b=wMdteYaKW+Ow3rbSWXhMJ446U1y+a0EvmN+9RjL+8EIuLzGb0mR2iYIbsviRI61HOeVd
	 jGNZQuEjU75n2BAxsAfgb1FwMyDzr3oqZkJ4SygkJcYczUOib7NKyFojhaxukwfJVx1m9
	 YuArA7jrgxjQDP6GQs2b3eRAJIArKi0Or+08snlxmO0qp3OcFy7bdvviBance1ALiVI1/
	 u+1KvBLw9e3ty6S77pXsKADh5ATVW60FCVQnCCFqsokVjWOpMAGeH2VMKFGa+c0lyftpF
	 aPk/9gXLz0Bp+iY0h/CoqelYi49qwoE+IAbbvVv1W89iN93DeeXNBtDPwq5kr3/0DUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
	b=dTlXgixyqR+0vuewl32cGPHr+ACLtpQLuw99P3DuO4VFhR2/uvO7NjMaMUPuasMshIVB
	 6pg9iU9F5LEAlzxohlGyTBiWMwypYKBaEsJ0xm70CkdxvoFU0HekwirmGUvESZONg9MJg
	 x27iwBg3Y7xmxfzXf9LED2KG5+ldJHH898ZMfxEqVKVVDyumX8Nu1NmY9ZjCwwlhFk1pd
	 m/OsQKUBm6eCnUOP6cmx4VtSgtjFEbLLHXu4BCIW1v30XRzd/jIl6Mk22jkJgmsNd8uhj
	 DFEqsnD62hOC+LaFbqGxr3454avk3nqDRIczQCHy7lvW5rwMfu9hNfG4Ows3zQ2yzAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OLE/ah2/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WRsGW+/I";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA4760A2616
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA4760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLE/ah2/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRsGW+/I
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1942433136
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=; b=OLE/ah2/EA/YApVL
	YDox7iNZKWVUiawjm/9KI34WLgg5QEIn0CJ5Xtj/tGcSNsBpjo8yuF5sLbGg4Ajr
	vhabz062Akceh+Xwm0SzRkpldVZOEMWeXCpGVBq7IK/fzgNzezHFiuA+w3qH18Tm
	dp3QWFIgoP7yJikeVctlZQO2suD3mHboa0Pd2LdktHuy2prEU1gfUVQBMxMCL2x0
	BmuWYWLFW+mgFvMqWEKREvnhOu6VK+V+XWJiI5/dkEnPlZ609NfHX/zX3JJCnS+c
	Z1CZU3tjMwmLdCpAEkXRy+5bhMWsAPVO9gOxL0RHxyBTQYaa5Cn8/rMUvEg+0WkY
	djwa8w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9ex0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:06:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so591514eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172815; x=1795777615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=WRsGW+/IlvIGZRj7xUeVO6UYyZvKz40bPU7qWE+Nh7Qhq+9GJkQsR+NnjYWWpmbsRB
         NIqLU9xfJW/s4ckYPd3ptSo3l5Y2rPfcZ1/RTcbFJkDDZTap45S76M8PVarteLzlsn7g
         QEwxrai6kAQQ7bmBa3fNbRnsasmWnfpi02tz7+LoU+fJCsumUAMw/3BqOVgUTlBSdIco
         TFU1HYpILmW2zEMuESzRDU0pAw/SRHN2Sftgvr/2vwJ5hmLyyxg13tor5un+qK2qjMWu
         L3b/8UkWpkMGjdGEBUHoaH5X4R+TCi5Xtp7yud69BiwPrv1/xdFio/WCPq7szfvMypYF
         GFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172815; x=1795777615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=DU1cE3zVyKjStZa+oLKs9E/dLVLnYxgTtmgQ9yK7ZSg0KYsUP/IR4ayL8vwBojHDem
         chzg8vz32tXlPbUdFOSBRTZQzxDKToj4Ds90Vu7P9HYA6W5dVaRq+3Tkuj89hcEKjZPR
         OkhSy+V48GbGMK3WBXxVkOa90DPeTPdK+IeiOcccmwKFjM3zEDiNgSC2/IKho5oY8UlZ
         k5dq9z4Gd5VFYg3Y0qiaXQWVlm7mohDJ2kUwzKdzqMvEnKKlOJqwi4vYP4duJHiFJqv0
         UZshqGZ/5DahHc2KD72aK1NYHvo+KYl8NbRXzrftzSwC4HbIq9+nsmakSHOOHpiZBzYG
         bcnQ==
X-Forwarded-Encrypted: i=1; AL+hErE1EZ6bPxZMsJVnbN1hY/VFXc04K1ay4A1NM8UH0brmDQ6A0vz2fJQV6cST83MtgkFHQHLnVz82ZQYUiHGu@vger.kernel.org
X-Gm-Message-State: APuU4Z/S2b+IxBFHexFaeHHxSfKsGxsbKF54ZbytpnJ8Xb3NfXeUXjhY
	t8f18JmUiiCPaukyT6a54Tdm7ii9P2MyhYKZL9pUu1XaCJvfVWGRw/acViSq6NhQub8S7evmmPo
	LLOo52d9+2oMIPgblBbo6azZ4vlq5FJPMak82YcbXTz8cKXXgqtD4NvDqS9Ai5aIF++lB
X-Gm-Gg: AZFdTZckUat6rOf635sY4Pz8z/IzX40lTxVNLX1KGooXRI/58ZzMGgcnVxCYwowOnrL
	Cb3nZO9p8L5AnBCkhgwLq0v89zQ/lBdgA2+xYucNWbnyt6hDfajEYRuyMzbfTSARFBc7Ig6dG4O
	+MV8nrGZCgVBOIswB5VfL9g+cIaILRgTiyjpo8bTQ8lpAmDVXzHQ2cThfWzYTtPpfDRh4lJ0rGu
	SEHxeP8hIIgjDNNmF0TU+8HU1j9+FcRYGVFsY9vqqANRfPpKwobKsOaJToVHhXcves6E7VHir4h
	DuRCKznktyyd/kAZ8Br8lAbPf0IkPtN5O90RnsLnbLCYbTsJVsNIw+YEQbU7WBgIL+COq/Ywv4g
	9i5cLLXnkBrGbYFJdEQBjMv3X6zDZdNkwMhxwDsp7s/K4J6hUPMNdBNUiVGQkm4MddrQRM8+aWc
	tr/KOx
X-Received: by 2002:a05:693c:41cb:20b0:384:4fb:510 with SMTP id 5a478bee46e88-384b4e7510dmr3920917eec.27.1795172814791;
        Fri, 20 Nov 2026 03:06:54 -0800 (PST)
X-Received: by 2002:a05:693c:41cb:20b0:384:4fb:510 with SMTP id 5a478bee46e88-384b4e7510dmr3920883eec.27.1795172814150;
        Fri, 20 Nov 2026 03:06:54 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:06:53 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:42 +0530
Subject: [PATCH v4 01/20] dt-bindings: iommu: arm,smmu: Document
 interconnects property
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
Message-Id: <20261120-smmu_interconnect_addition-v4-1-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=2417;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=L9ZDNV193MgcYYJuTHrN/Rk+LSdrA3XbSL8eIPKsLAM=;
 b=wdg5TvZTBzYicERdTGjHlneO8uNo7gn2OPeJEAerjHG3UyVz5Pfkn/6J0N4Bhc0D+p0HdagtQ
 2sciI9FlJ7GDWUDJ5zSVep6gADyCUDd2XYfiX8Wc3WXC3zK6xtK0mkb
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b0029cf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LIGS1bie0qojq0S7pNEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX94Q6/nMp/X5p
 9l4MiLtsqSAwGlEKvlWszIweQO8w0B+19A8KWbZKG8G7FMdgEVXXPTjoZ1OV2OP0qsctzfC0Gdd
 IkWE7JBLIeuwk2PKwp/FHlJJp/ypGzg=
X-Proofpoint-ORIG-GUID: eAevukx3GCIMZdnjY1JZQ_zMvgxh7pKW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyPXwU1omd33f
 DvmZPWHTWxTGxpgVzeqUO+N97qG08oMx6G6TmS6ase6E4+vh5wf8t98+9S1Poa25fajfJyFh8B3
 epocJeat4Ejs+21dvS6/yAVskwKD+XgS2VrFMG1QHAMFtPvVDmm2ZYqumsNEpDkMja+xxMBhomR
 9dq5xfhGzkma3MccXsvo9rIkKkXhKdgm56XvJgjRknWL0GWERF2WosQ0YOo4u2l60o/L0SA1E9C
 ITT6xjMzFGOoMTtC54vbAxtYQG24mIYr5it9v/ia4Fir7zZFGRCm7qQT3nhMsZ433/V5H30agz2
 rYjC3lC9zZjrA+MjNtklX/O0hTRVKsq3IjvjKyRXrHcYRZj/w2ZUrokLhX9nwg0h6lJ2EjTEi29
 dlK9s3fdwy0NOmJQOn6XDHwn9Y8K8aexVRBoPWbLGOQt6IS4CejNM9Jdwb6asqp6JMQsbHlfizP
 9e1FRGIaNARt6Ut1SCg==
X-Proofpoint-GUID: eAevukx3GCIMZdnjY1JZQ_zMvgxh7pKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Qualcomm platforms using the ARM MMU-500 (qcom,smmu-500) as the
adreno SMMU, starting from SM8150 (Snapdragon 855), an active
bandwidth vote is required on the interconnect path before the SMMU
register space is accessible.

On these platforms the GPU TCU is a separate hardware block with its
own AXI master port (alm_gpu_tcu) on GEM_NOC, independent of the GPU
rendering data ports. This means the TCU can be active during wakeup
while the GPU data path is idle, leaving GEM_NOC without any other
voter and causing intermittent SMMU register access failures.

On earlier platforms using QSMMU (SMMU-v2) the TCU is integrated
inside the SMMU block and shares the GPU data AXI port, so no
independent vote is required.

Add the optional 'interconnects' property and allow it for all
qcom,smmu-500 + qcom,adreno-smmu combinations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..ec0fc5f7d4fd 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -252,6 +252,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -656,6 +663,24 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      allOf:
+        - properties:
+            compatible:
+              contains:
+                const: qcom,smmu-500
+        - properties:
+            compatible:
+              contains:
+                const: qcom,adreno-smmu
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

