Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07AF371868
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091407; cv=none; b=H+cE8o/uD5S3si88fcL4rUw7YAYboL3NMa1jhGFWJJ6LoyBqHct5iViQLiLqGoN9YTYw2tMbuOh8NVG/rIeP1Ff7rNrERK8uLx6ZKodOA2O3fXU3OkPC2CkzncFbOUVDLN+aW+jeomojOVydel1/xAUdE1mx/6zuvCenp7gb8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091407; c=relaxed/simple;
	bh=u0RpEyfHVW5tsuPHKQ+xrD/oW/iPMmvDv47kBaoHopE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DujpSFeJg8gqH7Vc2nXC4oWR+2IqOWH1qNHxi5GDO6goTUBPYR4EfZyjigAl1ekKjIVOFNYPLz6UhcTWzYHytgN2SaZS6mmbByx/wVPwnq4nvJI91yKHhywYOA2yjObQ/3FdxDhHGDLXCpFxUccYs7Z9ti2vFQZ1YrDwTOyX9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wi591JBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EzoZ3wb4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wi591JBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EzoZ3wb4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777NdH93564240
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyMjEMkI3uuqQoPDpxm8QvmVYH6/5lFYM2OZO9jAJv4=; b=Wi591JBwDUHXX+GK
	netdBKR4T3RFKi/Br2IJQGtljLPjPJjnG0JMOHw4bLVVzaY2jGQOeyotQ/h0EcIt
	PhsLtMDu414mxClPsjbGIB8dcO0qvnyRffiZ1l0Mk3uETH0xzQjmUDE/NnuHF0u3
	ShU4M0tov6mIdjHvjrlIHaSd4FFHFwYXrG0Y10owWK1mX+mP1511ENtrRlynI33q
	UjHg+b8ed/lAQmEtC+96LBYaTdyB6sn853xBY0X3AfBk4TIjI+xwLernDZwjf5pz
	4LBXbK6o8Xd37qzzj6gk5pOgy9uMNcY5mJYlnBNbr5a8WxebNx7epdZy227P0vzp
	xjcQQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jtx15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:30:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee894b3d8so47708975ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091404; x=1786696204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyMjEMkI3uuqQoPDpxm8QvmVYH6/5lFYM2OZO9jAJv4=;
        b=EzoZ3wb4yY8G5N+MYJ53+IP00yl6sP63vi29ome65MMM0kVPvwVpRdokXco5sAqQCm
         0povo/O/9IUIKhTWkHc5SJuns4MmD7T/e3Hh3CGhzAT8m8aPl10A910lkmv4glN1H968
         ngegMsMHmjmpUcy+0dZ8hoIn7a9scAD5pdGAnCzdUek6YeS/3sm9rjewnxj9EicVjpPW
         iiAxIRVWfjbZfgZVbyLlCZnt/Q8IRVo+gdIz0Q0uW2q3Np5qIjZ4xhXoXeRD2v52yxR9
         LMArqtxvQ4m8k6y9YvB8Gt9YTjwOd7EGyh7DXf29cc3SPdASzXMmMRyzSP/wu9qfpvNQ
         gVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091404; x=1786696204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyMjEMkI3uuqQoPDpxm8QvmVYH6/5lFYM2OZO9jAJv4=;
        b=PxUoGRiU/TqGKvXRRXBjtJ4yShYFwuhVnFfltXrp7z8/GX83yWL0bMERyH+EPJ9Mjf
         kEf2LNBAeir3fE2opl7fk31cUWZhP9q06fRk5WSx7/iAb7XcfAQj7GiHVYBaIHVE3Mi8
         yIO0qVIu78Q6kAqdv1fZS+P+gco7sAy4nw4iF7q3Rqo3vYPwO3DtEkdf7KKmA3BPT69E
         rWxzMtn9leyYTnyrT9N7su8r1+nT5b0qHl6i9xzIe0k4PTjOXsd81qaTXUgWrSQnxUP9
         wh0XI6LazRUELbh33FjL5/2UEqNmYkFQl+5BQlMlUZ5nysZZnNhsl4cwxkdoiA85Rmdq
         JskA==
X-Forwarded-Encrypted: i=1; AHgh+RqVrQlfq24XZTyMb4+cahIEKL7DLPcpWoygu7gmRIPc/J9gCzvqtyfmCpGRXPlmjZnvYXNZJbkpixxMPTP/@vger.kernel.org
X-Gm-Message-State: AOJu0YwWzlM24BHo9VVf0VEYUCB0MGOu4BYEKrnhMWRg89svPeTsVHDs
	HQlw3GqsKbMdEG7mKANG9OcRxt7uNwjGvgaPxDB5MDvQZJrO8wTydHYxMcBF4u44v+Zoe6WS1gz
	+uQx9CitvlWMZZaO82DIi3eQAj3KZDazWtf7LSQVsNDksw9V8B0oNWyi4YPwjw+Kb8pU4
X-Gm-Gg: AR+sD10BVFq46irkm7dTtSmYr4tdPo1+TBqruuG6oYEIE/XrK6Bhac+GdTStOhfZBW2
	Ek13EFSyu008LycZxknEOARQd6PHhn1cnTWol0KlKK9jjNYsMn/SWZDyu3aQEeY0MS818NEhmWT
	dW+I3GBjiD773XBVKHa55nNDkOkrIJUR+qfK4I9/wMEQ0s3rNXzx8eYG4zzMyc4GgI1JAgn9iyg
	hy7pHzUSs0BgkPhgY2cVXrCBraaSh+Pda24Nuqv2AF3qQn3wcCyPh7QSivnToEn35R6cynY4o4/
	6fO1mOTtlJiV+kPNstGvLtb+97q/HueWlrHPxaqQz8j05W4PpbPXYh3M2Agpr9j7i/bvELWkk5D
	4ZxjCUIIm8HolyqQQmOBYGMMzREY6K3AAPMk=
X-Received: by 2002:a17:902:ec84:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d10134bd38mr95005275ad.2.1786091404120;
        Fri, 07 Aug 2026 01:30:04 -0700 (PDT)
X-Received: by 2002:a17:902:ec84:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d10134bd38mr95004455ad.2.1786091403646;
        Fri, 07 Aug 2026 01:30:03 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:30:03 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:55:06 +0530
Subject: [PATCH 22/22] arm64: dts: qcom: talos: Reserve low IOVA range for
 Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-22-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1882;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=u0RpEyfHVW5tsuPHKQ+xrD/oW/iPMmvDv47kBaoHopE=;
 b=q9PmABbezIizxr+Ju0so544IZepv/IZQYmBTS11vw1dzwObzZv3q58Kj59aFRAt5W0YyXu8Kj
 27T0VA9X7XVCNHTqv7VpzmmWOQS1l74Oz7OnbeWAYYMgFPK991abwHq
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a75978c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX/Ujt1vpP+XR0
 w1nIcbJ2tdTVOLDddqsqdR9HWXtaALJxYiLczKebWDqaCVprMPCBEGWMoDbcTWI1bwpg4Cs71UL
 f4ABS13rLDwIs3gC6V9cM0Z232DN9oq1qZtsah/SYShMBDQt7a84B3RZv+CXKFa7QzLz8/Otjhg
 kKhNCUWEkHIdiPqQkZkMKPgtI0wg20++BQxxFhntbzy7D64CpqAmnPHnWaHbwnLRNaK43/xGxv/
 CMT2TF9iF2KaCL4MkvpAIYfq/tzi4VaLyKJukTnoRThC0ZI0Fshg1w5aWG1A/126cet9bkwvs5X
 5HSAZf+A/nn0voSk4O8zfDVsqW44Q3dUdDg8CysPj5qMEy0VXQv6I4x/iscrbyZRHYJWM2ycwox
 dGQb6RU50sKBv4O8Jdi5sFhNFA0NG1uFo2rfrL+1Y8a1FE+/O/M8zuQlfOjeKG7e0biZ0But4Nv
 BzshzKikKB0+ILbyFAA==
X-Proofpoint-GUID: hwNvsbASFcAkdj5hUOnCgsFzMkxB06Zi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX+m6jN/ndGIVn
 pRYqC7ZKHSmIYs9j8kGnu5+WubeRz6iv1kl/qOZ0w70BdRWhTcFFCEMD0RT38KAiJGfn3YHXG4F
 rOoG8i5eCK2xpZ2ifd3LKOXZVDynJRo=
X-Proofpoint-ORIG-GUID: hwNvsbASFcAkdj5hUOnCgsFzMkxB06Zi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070062

Venus VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the venus node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: b83d3cc7a59c ("arm64: dts: qcom: sm6150: add venus node to devicetree")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479e704537fb8df7345452fe063d9c3..8645b04e266438857647600f4cf129dec9951c53 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -687,6 +687,17 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
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
+			iommu-addresses = <&venus 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	soc: soc@0 {
@@ -4116,7 +4127,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0xe60 0x20>;
 
-			memory-region = <&pil_video_mem>;
+			memory-region = <&pil_video_mem>, <&venus_iova>;
 
 			status = "disabled";
 

-- 
2.34.1

