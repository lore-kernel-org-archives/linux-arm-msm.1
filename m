Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172843;
	b=RBelJwf0iZ3ptyeGhy/7qNrOBr/1jdBgqkEoBT1gRievWj5gf93t3u1gMkokyKrzWHRB
	 m1awtRfuT+YwWvy4O7Jok++1PQx7443JzhcSmswvofTL6wytmoDuqgFDr3gZzeJzwjPwP
	 MDAwFBMmxATwOQB+yEUfVzBeBQl7QXRGe7qKseaT5SdpsKbUVyFUGFNibMCX69stWiNtN
	 IB5Ony8/bJ0/nKCTeGJFIjqqmysgYpDsldK0TOJtTR7qFEY5ypxUI3tF6jXbngfpm1+PD
	 y8QcWuIY6EoT7Ie8oFAq2WMa0Xj3e8wn4BNiAa6pPlAFveud3K1DioR9K2ZOgXc9uiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
	b=IkfaB0Uhk58PymKzMu13Zliy2NcHE56JIMFrwi0YDWXHAeAn+e8IZ0Ue1QAr9SVSOr2g
	 4yEOmq+zNIWI2onBk9sWtrYWxWynYw/qH40JUAXejKhr0/GkgWoJeZhwc9uR9MoMSMGvL
	 Hy9B1sCWj+/WSZZXKOnYJxHnJtnITsxVk01cPrmYs8yPL41nVE766PU9NqYAwBEOQjcc5
	 v3aYKf48h39b6O5IgiWrLNpCzzFLn9NRkdhhmUguc0xIw2Ydc6H6vG0Py6ZHGNBqs591U
	 O3rIWXE4yfa7kKFgYoSKkXV09010B/4liUb4xdv/q9xCoZzVAdDraTIfeAuG5pboLQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5ebzzsf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGLIDlCM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2434F60A5BE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2434F60A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5ebzzsf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGLIDlCM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtoj1681957
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=W5ebzzsf7VsPPxpM
	wgD3pCatpFUOUy5/p47/gHoVKI48WEwh5flF87JheCRDoMizBtVEJb/3Vc8cBZjc
	R3wHNPtoMCzW5v8tuePAIaEmFUeMLrJKC/8RCYCpNFpwP4asU0Nlb2PSP5zdLL+K
	Gae7xJR/4DtcGJcV5Gn7vy+JOins1QZAhOBMghIZn1Hb65JfFJGd3LPYi35KhlNM
	yE5izBJKJFmLS0qjl/BF7iws2Cpw3NRPaHhvVUjxz/wsMw1LIb6nmQte2FTyvkpC
	9V8F8KS5PfVuC4wUvm8AP/us1nIjBviuqwLOZl+3Q/E31xUjd3s5+36QVVQ68JEq
	nZdNBg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t3vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso2460792eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172842; x=1795777642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=ZGLIDlCMs/yzhDoH2wrwEjOz0nPz22N1YgO0WdCgws1FkRMqu06Xizosnt4G2RApKX
         /5jubHZU4P26qmGAldSOq4cBMH0lRMTpja5DJcm0IniAJfeQMv8RtOFA44PeXiCxzt0Q
         nBlW9YWAL9XaA5ffsl1LDJdq71oVMe1TBeJdjZaXNECcnaUL0mCScEopcRFPozjZlETX
         hMc1qi2IkUlxHOXetBWq4gVT8EEQVv12AjGiBmsufl73m3mi6LX+4AAgoIJXLI4QqwjU
         /knysfJ2m5fzHM/GsmuFNLxqEcNCMLy0SlNh8PZyEBL0L1zyIER7LAcFJH1zT1TJ+gT9
         ciBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172842; x=1795777642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=QUd1OWSdbpmewUi1zOB3HIDl1RICF0VA0yPsyO5PkXuFrTxiTJTycywfQ1Fam7t/k6
         HDwcSiGHjlRknToM2UwFA2gW7ezvjFDHdVMxB67XfS7NBn91eybIvPXEVzJ20Qm/2qXt
         AsG8piLmwLpqtQ4yMQzwQ56FUqEJGivNgboUnZKVcT+kkKv01lO+1LiUtD5+GCiBVIdT
         pztD/DbnP7HOO+dIcExdF9uHdnR0YSWho3C22S6gB7ePc+WlRmrCEVsjt12beeUv1nb/
         yed0YAeAtaiYYwNm63FuxvznwpPTSDD+AbbXkfbjnyM9Q3eGbqtUYU+ZlS9sYqF41jSQ
         J3yA==
X-Forwarded-Encrypted: i=1; AL+hErHdqYABCwg9jP6IvtOOmnkjye1MtR5lw+En8Ikd0Ci82+L5jHXONj9q3rtlLBr7WPlkxr/zmuecPMarKYa0@vger.kernel.org
X-Gm-Message-State: APuU4Z+XXjNe/aVRxa2C0+V8jECYpT8CfDdJ+AuQbZqtCtpnXaSd0VBw
	A4bpk9dnCJsct3x8LOuFMHH/oiVGf0AYe7nu9qYXNVeE3yFaAx9HYbiN52tjxrzOin8OC9gpL2e
	hKc+IbHCaN8rcPoj+NJWfK6WUJ3CD4W7R+voPiANYF8V0hBWKHDId/T2HbeOj+2IoQsWo
X-Gm-Gg: AZFdTZfKc8g3nJmTWh6Ar2cwrSk5CCMhkjvN8D3lpYQPkgumTWQdU/hjYZpYDh+szzx
	7SErLla9y+be9jZmPOmHlcR62rbkP9dFxcVulmEM++jlSFR6A1NZc9SwgdVP190G14WH6Av84m3
	25jZWn0hQ7S6bbZFN+CBf6nwUqSiDMOLNmKmo+QIC+RhqFRMNRJphr5v9xdCh5/frlJwKf2bAtZ
	NpYEgGZcNX1noOswklxAS+uZAMjP4XXpHHSG7yA81W/Jd545d6ZX89SHJvh21/QRrS+iajCg7HG
	C2XTnKWPdw0NvoKd6EL9NaF+plLfJIhjRKFT+UafuH52NqdmenomFg+sxxK5e7u0ct0gLJO/E7d
	YsQyyC1QEMBlMc0OYQJSQAmyhohAnPIwb/38zq8OuxOcpqDNIejI4HtAuJar4kf77VhkelLlfti
	wOMZ8X
X-Received: by 2002:a05:693c:4142:20b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-3856f4542e7mr2706101eec.23.1795172841325;
        Fri, 20 Nov 2026 03:07:21 -0800 (PST)
X-Received: by 2002:a05:693c:4142:20b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-3856f4542e7mr2706055eec.23.1795172840688;
        Fri, 20 Nov 2026 03:07:20 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:20 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:47 +0530
Subject: [PATCH v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC interconnect
 for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-6-cab8ee8be0b3@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=7PKy0XlSNrGfUIky+MIq+A+DSi/A91nh6BKC8dJ00Ww=;
 b=66qF+/nWyNlaszLHI6kXBTrNfnf56mWk2gMlIf8O2jXgkbggFAh7NqKDs7jmCnHNac8yzPs+7
 GLQvX00gi3tAwC66SIoqPkgnkyAmuUiWflZTxDS/kYgtXzWwiKmG/EJ
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b0029ea cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: bdXhx5YjhuaIeVJML8sZcFy1nxOwxisw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX3nlwCvt/HV9E
 ShhMyPN/zEkwrw9ttEgO/OD2NNXGJW47UqcHNmRT1AaSQqb/boYdrhjEC6pu7JYxkWlHYOwTTrn
 2+6GFmO+QAQwu1+umDW90QbtGQ7SJXWDTIDAPGlR+fWUriWGQVV5b++AauJTgpzXkRFDNI90FYH
 /ccAsj9D1z/dys48lwhwJjZHwBPwKSlNQ+5MdaSr3KR88N2nIfCYz3HVhgO26NX6o4yRYcanrD0
 eS7jo84F4QNv5/LNTPFkLkbkgqN9BfNjfxfVmPCk7o8ncvc1r/5PJlBdOfZjsJwvbNXvljxIrjx
 CZ98mDdpvEmBuB8K9kTorctBlqljlaTTQDz9/wgHLdtd3zFQa9BlmFpiMavvoKKrKq9QCq29wt2
 CkdfVTWrdXGpBcBInBVIbXBYbz9ht351L5ZsUMiV8m1aIu5zPg21LGCyEam/QuBrA9Rsu2eUnZG
 G0WHdZXgfwi250/XT0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+LsIN/ITRj68
 ly5jK8QgRZZ9YhR+V4cPc461wj6nes2w6Gz38qsN9YmqzuK8JTvVlPJV7/nmmaIQsUCVb0gm2zm
 Ctiqr0qfLfnWBD0fKiIZPOM8+vrslT8=
X-Proofpoint-ORIG-GUID: bdXhx5YjhuaIeVJML8sZcFy1nxOwxisw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..f022a44ae5c8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2102,6 +2102,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1

