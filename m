Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39F03AFB0C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091219; cv=none; b=rYuNa5mqRObwMdQgcnarvxVpOjH41s9aFlnHONwmdM91iotYMp6pjMYuxaTle2aW4fF/xyxeo0rtmtrm9saDoA5x9OfyYENdTcjMAiPcuA/3cnIBZiWEdJR5ytKmDeCJaPUKpwMVStpnnKEYP5k/PH39aGqDh3Tzs+a9hHi2T2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091219; c=relaxed/simple;
	bh=RUJJjQBrrcmOIMJRWgb3GGaWcd7QRAQLbdW6SGpk2NY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e89UKLlxaqt4YH3Au6iayAqmMo4L1QKQTu1Kl3vGsT5h9jAbMNd5t/qxjVTx9Meyxt90c5aYdVTiRLCU/HNwpl/NefTUfHwnGiSaUM4xG2sPDBrw7BL7MpWlzQA3uyq83cWvy6wdNKciXJgRif9WfNx0GC/n9qyjantrKYKwE/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSoe82Ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Blb7eH+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSoe82Ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Blb7eH+s"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777qPbp3829443
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcph1uyEXbBK81UQqq7ppFED8fJ0GoK6EhhgAUqQ7vU=; b=lSoe82HaD93ycRmp
	jSZqfIptQvaZSviCon0DPRODRDBisyj3Vm3K+tAb4PrcupTWlcU2ebQFsX/FGeAQ
	8qAofsjHhLL6jZZjMOp8mfc43beIHeoW8XoNwiZnupnmV4Uqq7whpvqJpQD+s/NR
	50kES3c3hm3rKgS09O/Mzqz4JvUx4i8JATXkU1K3R16dlEbz9HbzIMs9h2oGEkxd
	UcKuCMCAPCyT3Fx0PN0uSfy+Ity8wjQJ2phcmQa9/cHnaJ7FRWlNVs7yDR6PAXIy
	dDthHEE09Im2LBCE4FwyrbEXXY5oiFagbsZrNyIkp+xvvNQkHqsAKYFQwIIFW2+M
	LqhMqA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gu3xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:26:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso4617705a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091216; x=1786696016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcph1uyEXbBK81UQqq7ppFED8fJ0GoK6EhhgAUqQ7vU=;
        b=Blb7eH+s6kre+4d43N0Fr/lGE5ot5vXpa/HnsRqtwuq64B3A26coP13JWg4EhcfIMc
         g32m66vtbQVSKf7DmRS0swOt3cH7EmLKI8Fqb0kqOwIRGkNEcKOdEjQt8NxEqx0f+i7Y
         I9gLCrJUj8QBLlyauzo58/0BYHD2HM02wQMA8s9IoaQeqEGNOD3DnTyUYQcFKXZEm31c
         IRHt8YvDXhuTbbeOfmbIdy/QtBnNd4Ns+L7lAlJeTvz3i0srbsgQpJz1aLSGBJjCyfOM
         3VbflRcEU4brJSNbD7fAzUP/9hoJ+gpLuMYeyaZI56SQhbfDl0OO+lcjSmk6NLU5iftM
         Mn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091216; x=1786696016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcph1uyEXbBK81UQqq7ppFED8fJ0GoK6EhhgAUqQ7vU=;
        b=XZXyJSroqHuY6Wf+m7/UC3RtM+vl004TXyHxKQHElsTu/3CA2GJVtRaK7xkRNsfBke
         hHoCTopZW8HSVmftp6IokkM+rnUIhOGWJzyBjWt2pkOi3hsnsUf5xGDevYPxi8nW0wMS
         VIv9HzstQBgLXoLlUL2LvU7hBc26Vr5uFXaOTCxzITS8PKbbUOUFVUsuPlRJyfLSh7x5
         kmAZW5kUkTBIMf3QIeTLlTp3c/AJME7kefilXkeSTlusiwHZEYL9NW/NbsOJAHikiMrB
         bwY09lbUtBZTPzbJVedM2g/OM9WcnGN8KgEXj1TQXKmo6aRumokSxUeyUjT2nuXh4rYP
         FQCg==
X-Forwarded-Encrypted: i=1; AHgh+RoHt8K3/6ch4XH3wX5S3MbHI99jr8zN/NkPptkoSe14keS3MVISBbITCVWj/nv8CfhNLHaIUrsM9Vzuwlxw@vger.kernel.org
X-Gm-Message-State: AOJu0YxHoTv52RYpwwv0uqasLLy+lQCDyOXsM3PGziTKfH3CweoUqLzi
	KzN0qzqoMBPfAQDRuYZFHQpjByXGpfoSDX6OlX23suoKGIpEAmd0ZwdQ4funAqx7zF+GMGxrBpW
	N6UCme8ufDUUqYoq8hCl1y7LVw+i4dO5LLPqf+LIah501cOKaXaBuRSCvSYt1KGfTLEGZ
X-Gm-Gg: AR+sD131PxhjF1M4WAk8j70pK0kUwuJp3pMmHuS3wIWi7tpVmgIoNP2p/cmg2WCsJV1
	IxwIzSYgJehEL7iqcH0mzryPnDPrDF9lHY7ygT9ogyqUMBFK2Tf3ndeaUVECmiLA9jgSJO5da1e
	BdSHbimzWglwaGj1nR2v0nwrCbMIk4DTOe9slfgjZ7EXNs0ixOQUHjZOtTg1KuPfLJUEdTcVC/B
	cSL/ew5/N+LYfpnA4FkaQUOJ6Y7rmDOajoRVAGbpYxmPr9PCYz/IGS+1G/bkJ5c7oBt8M/JWrK8
	fV8srS9n3J7U2A6PpxXqMFxU4rd2gWFaMiEWGF5D2NHhppwQj8zhxuKynRHjVA/wIX1UC1I5p2X
	etmKIJbcXFdzxj8aLD40KGVDYcojYM8c+mAY=
X-Received: by 2002:a17:90a:d644:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-3903c582511mr21905490a91.12.1786091215614;
        Fri, 07 Aug 2026 01:26:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d644:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-3903c582511mr21905425a91.12.1786091215179;
        Fri, 07 Aug 2026 01:26:55 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:26:54 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:51 +0530
Subject: [PATCH 07/22] arm64: dts: qcom: sc8280xp: Reserve low IOVA range
 for Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-7-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1905;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=RUJJjQBrrcmOIMJRWgb3GGaWcd7QRAQLbdW6SGpk2NY=;
 b=jT7fpDMxPQmhAEB1r48JCbu5da0Ay3ZhKOdpZCYvdXzQIogTSsvTBTS3Q++MpalDT+iPX3At/
 SlOjPDlum3NCW788nIknlHygUF/WzZJ4N4l2jXaFYuh3S5s6rrFxlQj
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a7596d0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: NnEQTG_sU_Wrcz7WpahiYVlp0c6nXqfq
X-Proofpoint-ORIG-GUID: NnEQTG_sU_Wrcz7WpahiYVlp0c6nXqfq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXwxCMs/R9R8+d
 O2KB6LD30Tf+NrZXQ518oad225xZgXvA38/luXN1B+U4w3GpsQaYADYeOA9fzEjMY5zTgLxf2N7
 v5npcHbRi5IEJ1EYatlupxR5PMONo4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX0RC7EwVMnull
 OuG97QJB+s24XUJ1pZOnv/r2XEzKsEeddwzmhZx8SwSPIOGIi3ijbgP6r5c0GetksUSbIecYbS9
 XioPJnxsm5z10w5WbaLfcFC5j/B2uccU5Oisw2Y29TskqownIzuX0uRyPICl92p1qri1H4YIHCF
 ssPAxh1UtfDz8tLtZ6RGNXmoy+u/gnkJ+CtGnY56O/qeVpT0lL+jf6Z3zLP2l3kWqhHXTUtHG0Z
 KUvhriok4KD1XGqOvVbwIVRrEYLhJWKUd6af9J2H4/jvDdxd3CZQAlWviVDpZtY4zX927c7jUit
 poNjdroXzHASllq+InWI//hBb0hUYNKoiG9TVif4ELVhA/tkeNZ5ZUHS+ZN78mGXTo3WeL+LjYR
 anNC+tvL5mrZ9HX7MXkGTTg/aFwCEKTVaSjchJa1k/ekrw8qPDxCiral+Iox3z6DyQ2ILhltYwY
 Cs78z67d2EuFLbxtfAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 3a52eef16b97 ("arm64: dts: qcom: sc8280xp: Add Iris core")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb4e465a71e60a2e295f9a4b3c668f..1c624683d003361773b5cd1e95424990e8130b9f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -669,6 +669,17 @@ reserved-region@aeb00000 {
 			reg = <0 0xaeb00000 0 0x16600000>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -4266,7 +4277,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 
 			operating-points-v2 = <&iris_opp_table>;
 			iommus = <&apps_smmu 0x2a00 0x400>;
-			memory-region = <&pil_video_mem>;
+			memory-region = <&pil_video_mem>, <&iris_iova>;
 
 			status = "disabled";
 

-- 
2.34.1

