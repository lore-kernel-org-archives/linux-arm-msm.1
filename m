Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182223;
	b=FR3sXapJ2VR7jyq2DX3gU3BHGe6tMm8YT0J/I/MKhWzs9BLAgGObuqkvO74ePeGEx+Sh
	 +cJcz19vOR0woS3cs7t6+tU4mXdmiXAy4dw/917xxmekDwpKNU78peeyJqVhgGjwIA8di
	 VDGCtbTX846QvI+FLw7Ylsk/5oTocghDGKrNiQr9E7FIPRIJivd8VJKUpypzgBBmPB4PV
	 aLxR2pmaMxypamZ3yr3CDGGiPdcTizeD+F9YBUCYuWdTKN51FED49q6IXGHIyCmN06994
	 NWmb+981r7DkInNH/fTHx8KnS2OfpPr5GVYWqly5IWsq40O2Fl0iwMRqR2xh55cIiQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
	b=gDmldbSGl+Nh/iOzEzd21PbACh+chgLWgDP4JDrGluUZlHfhzr5WsK1O5RbUPDKuZmLL
	 rsGf7vma14QX24+eBW61HwXJlRfJCwHHmV231HkJ3S9y4H6EDmj/cR5bpegbGaNEtO0ts
	 J1yPq0Av94CsKdBsbl63yPmX9EQ2//C+vgYKv6b+PaLsfX/PlUdRIw8KchR7RYhRy2kWR
	 7a18phHSiSauzigCIyyV0L3Z5/Bxs/huXu/Wzb4CYaHOt2nt3qyEiNwlqmGBBHLau0xhC
	 qwMrx8Mmf4L+RV1zYK2eJNU3xrys7ZXDRo1WtlfI4dwS0KpIiDhPwhWiN9TJvX60MRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIFuxn7P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKppiwsj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1A660A2628
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1A660A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIFuxn7P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKppiwsj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkDDx1017072
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=; b=lIFuxn7P2imN2pAV
	Tme6IE7vbrfEh4VBG3ZmY+gFc5Yo3Cts/tO2ovzN0nb5ltc8BSnEVUbt0ooxN1KW
	Uk27FMs72PkvC0YSga7SHh+D+HaiFk9EukiEL6x1A5RLgJk8JZJwmTrUrpNiqZBG
	l/WorKmayiG2h/Tqofq7KpKQJ5jPbFyk1mtFCTlyduL5ifSbwiJ8knGeHg9Uv5uc
	+8n4P+4rVHuLpTI9TGZcChMKyc2msPPAUsfB+2PMXX3fF5aY2WkmdYJyWyF6MDFv
	Z+voFFBeVxuq0upyW5i6ni/nZbVo8uSu/dR2CPb2nFcn2rkWbhFWV/lO3EDsdDdM
	EOKUXQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so1374060eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182221; x=1795787021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
        b=eKppiwsjSKIkWwZ7Sq9sdwXtPNbEcsrWh+0Ui9GY0DZIU7VpGQrVpcG4x3kAZ7Y+zJ
         uj2wMc54pMSiGRJySbB0foRGsRA7p7Py7nRzAxgjQqxS6E4hF8Y2vockiZRYMo2a8fin
         KAXITB2BniF+mwX8J9MsLxvqykIRHqWE83fC2RfMoE8GCoRqmLUdzILZgoaYPXlY/F6A
         rHfu4NwJFDojXexBdgP0Im817H0+rTo+MEQQfM+9Z7vLg7C8Jkll8nOSIZHm9waAlgf1
         5Zd2YigobvqGGczBzXkvPjth+e2R5zDBu7KAHf6tVDX3t+Eq5pyM2/cQIVZA9Cz3WDny
         qvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182221; x=1795787021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
        b=L2jeFi1vTZBK9VLHhh1sc4x5oqQBtirr5xq87p35TNTAbISy6YKxZjD1kbdZGUkFDq
         8n0stzpOpkad5PLbQWyOpCvuZPLpOXCR/knlYPkHG1VKo2DubQeYC0YjN+dl5Ktbnof1
         yy02sKf5eT+NAxGUf3dQYsfdUI5w2TcQwfsUBFF2tw36w1HQFem904uZahHw7XNPbP5o
         feoH39v4b0i2UomicloDVQETJiza4q0gBvo1qwxs4dwEZySzxAvUDn3U3+W0Da7Q1wFA
         2RSrhYqSNNJD7qSKzl2qTcGonfdIF9G3Uqh6xyeW94LvN7G6CZ6qXLt/QxXFlUYh8jSB
         q4xA==
X-Forwarded-Encrypted: i=1; AL+hErHboCFiMFt4lVEJDWKpn8Kv77xDBkNpONMSCnx2Dpqr2Dvg7tPDwDEzF3UdmZqSaVsQBozaZavHlro0n4RL@vger.kernel.org
X-Gm-Message-State: APuU4Z8iZgVwGGFM7DDNfpt+L1BpZYdlRYVhxMYc1M0xvfp7md64fv8b
	PJFa7izLdDieq1suLBBPG0PM3KbkpOy2GysTrXAPtXrzErgzLidc/1WHshB9zaiNPVJg839B8vF
	4jR6UtnC7kawmR4RaeGjbLOeXno/hQVnBCAVGK9ztIXY97IH7W4I1NrGuXGNRdSCYw7Kp0MOIus
	8P
X-Gm-Gg: AYBFou2zg5w56asRUkie1AQ425QUUampmLgjefhEIeHQAV0r0Jeigaas5fyyiTOg5CI
	2GgqwdEBwWx+NTm6ofU2N8dfgBFe2nFsSSD4WSiyOTJTp1ey68sGhM8UsaahAH2BFENJIYPuPIU
	jAjvUqbICZze2t6NEEdyES6vdMdilT+3ak06qKmY3m37HUhNUoxdHCAKEZOGaqg+K43OY4LUDwd
	weEqC7ZljcrHdo2krta9vwESUlGf0zEdsIajPAETakeESjGCsuEOlC/hifXZsaRLJ0cUFnQkxn6
	2H2zE9KxViW664w7+fGtROEYgzspU6lFGKKJFK/NnUzbiatAiPEijTGRHe7sPcjeccnMDWG3gHH
	gSdJtazHaUQFPVGyYryDz315xMXC5eSyuXau0N8u5yeqwldxqyqFypbE48d19WX4BH2vKaoylSA
	nN3jc=
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2866837eec.5.1795182221055;
        Fri, 20 Nov 2026 05:43:41 -0800 (PST)
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2866785eec.5.1795182220304;
        Fri, 20 Nov 2026 05:43:40 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:40 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:45 +0530
Subject: [PATCH RESEND v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1038;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=QynpQTC+tS9ewt8cTvKXC0ob9aCwyQ1VtG/dFxw7GR0=;
 b=FZbDUQLy5/rKPk183XwUoaQlvO2xvFMjsoX/3ofTAfk1NBf2M06oyjxOPBXj87iMxDLttr+ro
 Ic+UGssZrIJCSIIiqPnXLE/1eFDIukT1LoV5Yoo2qcSPsdGc//rTOlV
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5mzuDX12BX+m
 Mco9f0udMusp4b16SZSvSPlUz9ORKMox/ZdsKhRK+LmOShFXlFsrQjmBwEfPbYqI9YBqSBQ2kJR
 FtiHUdx/dH8s6z7NTWMfYyzv27SM3Wj0ov7oL5byjiLVxtnPwWEIHRorKlsdrpf42ov3FGbVgTi
 +pQ1R0r+QwjvSGp4blVt8W7+mh4d4mLJM2wr3nvTGGrBwERuLx8oBIY9UcincZHD2HtcI8M7nDM
 +Z/uBY+YD6qK6I77VpP/W7iSIhHGlXvrqylGu/Uvq4hqXbaL+JxpIaowuo6K0RPatiKOGi35jKH
 Opkfgoc42Kfj5YFdGLhIOv1MQLO2WCfsaYZHWVifKVzHkOsZ0zbSyLutEkE8A/KfazeJ8e0tVt0
 KWxE4FE975botGLDue1WdxvntpQmvdY8HKYQ8lHOUmeHu36eQhTE822SIuLGLn9uA97qjc0Usjn
 dOiZK/g+ALYX2wMS5sg==
X-Proofpoint-GUID: Zv9Ffji0opmqUNB9hQsEGvximBBihSiB
X-Proofpoint-ORIG-GUID: Zv9Ffji0opmqUNB9hQsEGvximBBihSiB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX8hju/ok+fLLI
 TellnvOmeG6RZGGgM/OdZ3iSTvf0aTzj0lbkBeGY+Zz/NsdfPb4FukG4ZO54dLmmy4hJe8EqpHj
 L3L9WbNOZ/Hk0bHN16+Yww3aUjxXZcg=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004e8e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LWIT_UWqXYlThNCXQxwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..ecd051ecd680 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4413,6 +4413,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

