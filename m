Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036B46E01D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091321; cv=none; b=MI26OYG0c2voJ7VcNuZ6xgjuc546YqbzfJ7Uic6haeiNYjVelVLSCa7/1nn/x3b5j22mZol3/YasN0w1c+HM0vmlEWbRn17P9V+oDFK7skHygZMU5D0oDLOdl2Gkgnt4dOZ5ZDowUbc0plAblMhbSCh7QB4QkNW4fCs8yv30vMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091321; c=relaxed/simple;
	bh=Z5SsSJ+MtmbywYAL+yRcDyc+yQblOfhMrEJFzYs62Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+ffr06EMLheAyYFr+ICwveL/W9XrNgYyfjPfhgP7YAxwWXZlh5oJajn+4D/XqJu0R+xaH1R3wffhJTpjriJ3+XdmWSYZin96BY+diUbTPQbLFDn2Ot32nhq6A311RXp1I7xu+iep40mdiV2sivhcnSdRExmoqfYriqMgYV+CBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEROoPv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuF597Qf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEROoPv8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuF597Qf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777p0CD3533322
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/jMN4hDZiHyIv+z1oMYkJz6QCP0Pz4ujHu+qN6EosU=; b=HEROoPv8ZpRPHiPB
	Jeq3EFFkHE4U16utQBH7VmtF7RWsRflwhfcfzs6kI8qdeNEd7n2IsnIc72ouQDvN
	VEJujgYsg3qPxL+VWBx+tOnP1FVnZwsXrIAa0/ljuo1/BPP+5ZO2F8ZikcxcKtHD
	6nibDgDwjUzHiawo3x7y14YBT8Z93rJtiffz/7bBEEPK6b007UJgVS+lClqxZwn6
	Y+8En9r9wDvWrXo4uK6ihd34jYFh4pZL5bGaK9V2qoXC/GpDsHXDfW3AMVoduN8J
	cI7uZMD/ZA5h+5Bdse/3LmO8Nbv2m0ZDLnZGDNAtBjt4LCRwcQvGG9gP9+ObZvhE
	hyCeRw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fu41m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:28:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d122bbc621so15692475ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091316; x=1786696116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/jMN4hDZiHyIv+z1oMYkJz6QCP0Pz4ujHu+qN6EosU=;
        b=JuF597QfbtXfkqcJlyD4yRlX1RtY1FPcFZ+5VLfJd5vdgrdshueC8dYlccZq8Jj7nA
         48glwwG+lKGdKaC90Styu2mF1EuHk6/3Caa9YszI/qVuDoQtaKEWStRTcgdIlB01+GuW
         oFEjalXh4yrbwSKPdw9lj2vR8NMPoxz0DbXepK/JGgEOUl2w3A2vvwfWxrsIG4dRNhSE
         WsF546EIag6idU0FMDil2z000tUSTGahIlklkR+B/odDkPfDiFIWK+pyq9+QartPPRtP
         zM6Y/RKeGh6wACyP5c6r7TB8TcU9I/uiVOEOpBZHOJd7UGE6tCCiw8ZmT4fpIwiznfI7
         NemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091316; x=1786696116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/jMN4hDZiHyIv+z1oMYkJz6QCP0Pz4ujHu+qN6EosU=;
        b=fnuzXgEac/p4Kl/z6UjbApDRmbc2rrIDdnNj4E1w5HXfDwTo3lR2/xtRORwPYkKKL6
         46Laf+huiGx6STSbyuy0HlIjfa7mEFT4jlrc48sJk53NWgc3WwudUg2WN4BfJCp9Ga4P
         ooPbxr1p8GOUqZOAuKCnrW9wOX0H2mCWsU0HZsmAJSr2zmu/dEEteNDtdaJGACvRaT5X
         ONrRg4oSU6SG17JzPCcAqxFr80NijyTOn0s31wlHEGWDdcJT+HSNcB+1BANW6lVQTAKm
         fZyQZKf8oUgkyuadjhmHSrL+twLd7qgPiMUg63XcamJK43Jf8WNus3A5SZVLox25tRDH
         l+aQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpQ73XyF04LjJ+3bvgh89NniKMM+7R1zsZiajTdjginARs+Fp5geOJ6JGylh+A8aF4jZlbbKIvnAZZVsJf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/MBGyDE4yCn8ErPfainIZwLzjTYgMYbqSgTVCfPmzCH0z/Bf9
	qS9tnHXdRqwDc4doeh/nLEL4hnUJfA3QW0eneXntIgaTbkFqVbweXtopQ4e3QDKSM1BZyUTQeCk
	W7xJ+Ahs/p9zrLqM/lAV5glA8ScaD6H+pCSmkZzYp2guCaKaWoy56BPJkIPNvpLokgHl5
X-Gm-Gg: AR+sD13n6DDS0ydHTePkdKUN0GawxMn9rArsmMMN2gEsDXkUHYgEOOiLa7DKpykKT/p
	x1/L72j1hORI3VH66gpW9aWGzluhheOfSyZsF6RwIXuqi5a5PxjMNQHf59uupGjrWm223KhtJ3k
	m+Ip8um6MuFmsvuFqloEVE6VsxrhmBo8XFiR9ktt2ytKvZJFxiZLQcXjTWkqUataSgrgx5GM9av
	dnjwXHlaH1o3jIy679DsADfgbRJW1qIwPA9xzIInhICXP/UaFrX7+ubX4yJZIiL4SY5y+iZ9PpB
	ijIlDoaUlh8Q0U5fhKhvJW5a4vg0z12kenR8IFyLbkBuZDcHLTSOdftOHFiOuI7342B3estHKWX
	6jCvf9pwamKboDworEZaLeYIXEkq2lPY8f4g=
X-Received: by 2002:a05:6a21:6817:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cbc0490091mr2816616637.33.1786091316086;
        Fri, 07 Aug 2026 01:28:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:6817:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cbc0490091mr2816554637.33.1786091315666;
        Fri, 07 Aug 2026 01:28:35 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:28:35 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:59 +0530
Subject: [PATCH 15/22] arm64: dts: qcom: msm8996: Reserve low IOVA range
 for Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-15-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1865;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Z5SsSJ+MtmbywYAL+yRcDyc+yQblOfhMrEJFzYs62Rg=;
 b=ebGb/RXaO6ClLAVk8FDSnFaaOMeaeSe2vv3Pddc4YAjnOOHvLjdczk12OcoBe+zd9pCK9eKbk
 V5FPP3Ej8jxBvSMlA3V4eR+Hj3mGavvP+kUTLyC0yf4eMzrRKIEQppJ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX6pr2feY0AYlD
 9SEtffYk9RrgZx1zUQRMMXjVuDnwkf2HpOWagmexDrmdTh13Tg7JnLckeUk8ivsH6zrRqvMtSlr
 HVHQT1yUwThgtFuErAtBIsSItr94U/cPzwRIBXtpZZDVJ07HJHZhaK3mXm6cmVE52w5Es55P7yz
 7jGjnHGRby4ukf6AwIwtxSgWhA9wN2hBFzGbQ85RhliR5mGskTtr8Xf5afzweg60SPktfhXBOC2
 Na1Ld11IWYjzkQiOnVhz3ppyHmXxo0y3e1yvfOYyxrwSAvyVkPd47o+Ov1j4RhZ5Qp4EDRqclZJ
 15h1QRDznHr5lZAZuZlK0RBKvvdfwfgnE8cLft1tX+GScMYpCKAtdkTiEAm5ZfDyw1SNmot7zaw
 IS9B/pkD1k2gyxeZ7u1tXa77wTr6mH33jphL8TQIhsJEZhfCheIfvfdRBiGe3LTr3UNvG1fqZRN
 G667bl2bdP0A5loBHNw==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a759735 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: L05tMDWdC-FpnMfBTfBwOkZcrMPpiIF2
X-Proofpoint-GUID: L05tMDWdC-FpnMfBTfBwOkZcrMPpiIF2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX+ubFrJgPRQm0
 XkCA4fOPFBVZmyEFuHJTUMTRa7zNfY1o+FQXAzHdxyM+RJHpZte+I+YERfH2Z2AUjXRb+jPed17
 3df6kSfl8QcWYvOI7UcnopXDpc1oISM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Venus VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the venus node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 902d97a44211 ("arm64: dts: qcom: msm8996: Revamp reserved memory")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 818e5660df91d9bae0c3077f476b50a28f2baee4..e8a01b4d0c462f51ff4b40af7ea1665f2e231699 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -592,6 +592,18 @@ mdata_mem: mpss-metadata {
 			size = <0x0 0x4000>;
 			no-map;
 		};
+
+		/*
+		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		venus_iova: venus-iova {
+			iommu-addresses = <&venus 0x0 0x25800000>;
+		};
+
 	};
 
 	smem {
@@ -2427,7 +2439,7 @@ venus: video-codec@c00000 {
 				 <&venus_smmu 0x2c>,
 				 <&venus_smmu 0x2d>,
 				 <&venus_smmu 0x31>;
-			memory-region = <&venus_mem>;
+			memory-region = <&venus_mem>, <&venus_iova>;
 			status = "disabled";
 
 			video-decoder {

-- 
2.34.1

