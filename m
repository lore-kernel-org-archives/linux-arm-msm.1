Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F7F4746A8
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120552; cv=none; b=axlBjtEnt0qqkjGGjAWo12pOR1oRhccr9KkMENZacJuJQ3jRZp6DygdvrPzo8vKTSAPDT/4zlq5bHF+rSK1GSkXevus9SSj6cf8Y0sSSeT6jB5jYcWMNHNDgtsN7WXNflzPuAwmRRbPzX3Cw/czlri5uerq3HfU+e91jrTBU4VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120552; c=relaxed/simple;
	bh=nJQ6r5H/0sbm3Ipf+kjtgpP49WXNkDAOG+3GlAnq39E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rFd9ptuuhHgeZ7Avx2bw4LzXpcq9Rw9HA3AtYcciq0Zh56T1p0Cc/5WWWdJV5zXzUV4lGkDdzxZ7E98Wj7y1O+kOyGQYrWjK5qQvkYaLXNLABPoL6CFw1qRDqMX6P9sHLF4MMgkKNfzp7R6WJ3L+Y+NVSlid+Arf/aFLGe/bkYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wtvq9qxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8m29J7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wtvq9qxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8m29J7u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOIX91796199
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 16:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KdA/Kb3r11VlNXa/W+wAmDlV9iNwqh4hIm4GesXpn8w=; b=Wtvq9qxDUBPNewjM
	0q7r7w3VPvrMOhvXXffKYGZy3aF1j0Tv4aI3gkpfDF2FhRtShNjLYvJnXddH4lye
	OlkovwAICLojNh3CFq+3GK5Ms9PWpm8J+lPgzbQN+/lUTjfpzOmE+1C4HVayD65U
	D1kk2aGaYOYqb4rL4MYCWK0V48rwTuUrnf8CnmnGxiTomylWwbwRc81uYDJn8xwx
	4SljOxilLkQlPAuETVGFq6Et08wqK3EwJEZqk0gcVdNpifcpcmx3ZcgHQiYlG3fD
	Mg+L5xsArGVfcdyfxCTsyTphtrZqc6D8s+EE+pHkH9je0PTq4jqWIU9K4QQ35JCZ
	0/+4iQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gvx1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 16:35:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cea6a46766so60375525ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786120549; x=1786725349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdA/Kb3r11VlNXa/W+wAmDlV9iNwqh4hIm4GesXpn8w=;
        b=K8m29J7uGMuHRZ6D2FCD9IbifEl22jgn+GAqyj1P/HS+svsvk32BkoSTABrplz/cv+
         puP2EUEqRHWuCjOlK1H9QWBEpt1qUzPTNw1uwXrN2dJVkiQfitA6jVhD8eTsXLO3TdHy
         QzO7FsfYid036wyoJ6pI5MH334xecBy46Iyh/qC+RdnAwnniDa3/0LYVQi2DILsDYrLq
         tZiBZubpR4sP6pbPSwA9rPqazWLwq1Ta6lJCMnNvj12goYaVbvt8KdpsFAPu1F/68dnq
         hTyhZAHe/HeiQznMeiDyUGSTH2qIqC9NJRxAL/agZAFxKGgr6eFZ3jronl14NWFSc+Kw
         wu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120549; x=1786725349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdA/Kb3r11VlNXa/W+wAmDlV9iNwqh4hIm4GesXpn8w=;
        b=Pf6Dt1jegM9IMQhkIhNX3eoKCYUQ8Mi54LG0lOXKTmMlqtIC3QC4If9+7/8Ijbu5j4
         udJWGXN687ZBm3HcRwZRNbza2/v6vSZg6F9PAciXtJXKCwMcKbFb0baw4EcDivRYrmzb
         gRB5V3RNiw4jiAQG4/vQIcDd/zfgGvN0N/9+6XxbvD19nrHhk0Z3enA4sielUH6oz/RB
         OA4SBbyyyAHtmYxt3ZndRLY9N3vRFcisdmmG16m6GdktGcRnZTSSIxFBq5lVy4bYnaYc
         XS758WrQAX41PKYc6QLerBvVt2VYLoCo38o2zI20RprQ5/FWBXgz1eEsA2p+RjZMAoqP
         hbpA==
X-Gm-Message-State: AOJu0Yw3bP7L4uK1r3mmveptLFEXdN/X1sA3vVMnVUqsOGFi1AXu2CNI
	huFkdCv8SwQKP3+y5D3StI7MrppfijcIigXuscLlMAKexpArapT5PqFtHgFDIzT+MC5ruK09CHt
	yPeeca4wq6fqcJNIuyHzLCCqPNCqlui8yasgn5BEXjEm001y1vl2MHUCXqvrYC8ojG/qe
X-Gm-Gg: AR+sD11+CetPE642c5AZ07e8HhIO/INOFHkVYqg6TeO1OsGELtM3Oc5og6G6oUOSYUn
	O9LsWeakr3tbflViQmwXE7LRYdxFCbgPPSmSt1Vtz/iZtdDzVWlOhjXeflpNVw4/GM8qhHPGaH+
	CmyMuPW/4G/ByldTsEnBuMZAbG737F1FbNVpLAbyncxnqCU9A6k8OlSVQuBVuvZwU4V4zOyxAHg
	hOKJOFD9V3rStyl+84+qa40rmiOhJP9kFmR39PDee7XDi4sMFrkAGqFpX3MzG8bmgzmO1KUIg1N
	Dy93qv4NANjfB8MgtIJjayyBzJ9k6Bw6MwZwwEdLSjLfXJ1wesHKTnAvrNG4ViKGRZ4j59ASWQu
	CmHn89EniqaEiAdftWh5I6OeB+KGF0pL+B7+sZXRlIiWF7BoemDvJZ0/cP+ksbHyFXc56nxh9zf
	NnlbEyyCB2QnM=
X-Received: by 2002:a17:902:f682:b0:2d2:ae04:5712 with SMTP id d9443c01a7336-2d2ae0457f3mr9810485ad.21.1786120548804;
        Fri, 07 Aug 2026 09:35:48 -0700 (PDT)
X-Received: by 2002:a17:902:f682:b0:2d2:ae04:5712 with SMTP id d9443c01a7336-2d2ae0457f3mr9809475ad.21.1786120548223;
        Fri, 07 Aug 2026 09:35:48 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde2e6sm8918689eec.21.2026.08.07.09.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:35:47 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 22:05:31 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable quad
 SPI mode for SPI-NAND
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-quad_dts-v2-1-6f578d4152b7@oss.qualcomm.com>
References: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
In-Reply-To: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a760965 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QrhUAEvljbRiGgZU1AMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 1oH2bMdzPD7kZbWYmiYGkg8Cy-SMgtIK
X-Proofpoint-GUID: 1oH2bMdzPD7kZbWYmiYGkg8Cy-SMgtIK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX/p6+SiT7d2/G
 E0iAIkYBG2ON5XstVRNOoJgdlJ5+3CLwaCcNUJyFPJjqF3WfucHdv+mTMq9FmmqGc9EIXjBX2g+
 6RYamqfsGsNiUwymQFl1yFWFBB3gBmo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX63V7n7B0Fkth
 yrcmd8VqHa7e6sJLnqzI6UILUX2IYpKqVbvZmkEJo3NSh6Ye9IQyQcVSVyK4C6sO0KpaRhRWXRH
 TgwQgl/hINZl3ItUJa0pI2vRHIaW0vpeut13AXLFx6bV0/3kOc6SWAl7TPwE+9ethIha3VLYwVK
 FEF8uhtqMDNgDsFP2WTekU+TIqDkSRy/pT6oof9TkkOdV1X+SsgrDyg7zGMofQgDnMrKxbcsEq9
 Wbwq+7UhY23IJlzQllzoMpgKfJwR/qDt9OfKLqf4lkYlSJwYI4RIQwtcnaKCEiYcshjrs8wF44X
 23rYvsNKrLpaLDwOKwmzUlw5Rdro4XRrzU50BLdY8DICrP1po9wzL+dsJB1wEbsLtAwdzVGD749
 iamQx1CbxdmsLEJRrOBe8V2INUAbhHLRm9BVLI97oQGzU76oANbWCDfzx+izz5VuS1Pds1v8fGm
 CD6biG2cBAJiwSx8OCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070129

Set the SPI-NAND device node to use 4-bit transmit and receive bus widths.

The board supports quad SPI transfers, but the device tree currently does
not describe the wider bus. Add spi-tx-bus-width and spi-rx-bus-width so
the controller and flash can use quad mode instead of single-bit transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 62877b46f9b3..86138529ba77 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -249,6 +249,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 

-- 
2.34.1

