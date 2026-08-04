Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE94377AB3
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846785; cv=none; b=es4vcXWvyiPBzXZ5sP+EEkF2K6Bpsjs+XTzUimLlJSo64pGFyU5wqc8yroX4EOn8P7GMyUH4XihVN2WLB+vozyW9uiB+3EDmu/eIWs27lxOR1EEBKNakX0F52XJVduYePhgqiVl+CfJoBx2BlFPVnXRpuSynGwdLnBMUzYEz80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846785; c=relaxed/simple;
	bh=wUKqqSPQI/PF9UCfBdKpKF4JWei5R5u9/X3546YzvMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAVEjzLCCPZooa7sWFrXU+/JTauzMmqROIxU761GNrUnNQfw5hGPJFiJsA4isqO7FqdBnb5mZNAVCS3+8QmzkeWL3JLxnvqJuaVPdPHrKCadFdcjKUTY48VEv0KW5dii/WypJd9RSX1DgLw7JLdSzECaGpMRF832mMrzK+cwp74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikRiEkKi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKV9ZHMa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikRiEkKi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKV9ZHMa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CX2pi3965838
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 12:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKSpi5FxamMSH3b7fOjLfmrRC/AHklHEaEAY2f6807o=; b=ikRiEkKie73RpPcV
	8SiGllmzMFKdThsIIf9OHORSk8qYpyY++qdtWWunnVRTI9sNeylfRw6u/4872EGF
	n36eH4jt1grDetqxYyF7KXrix25NajG236MKVQClmAMALESRqZY4GS36uXzuVt7I
	lvrTkPjzcBG2sdK+6zs3i0/2VFaykngQxhk6Wq+u+brXTAFFG6g71FRgFk8lTFJe
	zQcup6TnNrfzjXjwtdPkXWy/yidpiCrE6+R0xcvKCYdXc/OR0+CA1B8NE+YL3MLk
	ef4f9bUXerFtjg5aockTNWaSuIlMYDaUG1o8duXwLkvH9Oljgu/jiJT2yrGuOadt
	IJKlhQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r462d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 12:32:59 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9f6384168so1097422a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846763; x=1786451563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKSpi5FxamMSH3b7fOjLfmrRC/AHklHEaEAY2f6807o=;
        b=AKV9ZHMaCScjdduwTa5/HDGirolSmD13xYPxijnU//iH5yUUcFGhhbvGgsX0zwhUly
         Q2RUriFCUu7vlmVOvUCGjqoIG58vidtv8U8wZumD0lHR4GBctIFqfvFnhSodEcrDEs4g
         pnei+PVrjhDz1hmPT54Ji3iy+E9ZgrlJh88wwEOUJxFr8347UbxAiE8f1n7t37WYmJRd
         SpUtiMSbwN9EyfCMfeUIFOe3+0PB83XYFw3CIn+shu4z4DT86bsckb4h4wkAHr7Km4JZ
         1WsyImZhoisgkDRktLGCmBWqvL/mt6og2IHAPsTk+DcO5i13dfPCN2H46wt8VuYtuasa
         X9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846763; x=1786451563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKSpi5FxamMSH3b7fOjLfmrRC/AHklHEaEAY2f6807o=;
        b=OohXadvLj4qwOOvnTVu4ooes3w1FIaJj1zu1J+jGk4JPt0djN2EZkRM7PLdSSzNsYH
         EsPbSyxmvj+M4Jtjy5cbLBsEJndVemDbpf5wuqZFae8hirTJ8UHHXIITDgUIwQFjFMpP
         CHbiv3sbpwiIATO5V/4ykne+I9yUNqR7I7Dqap+ISDmc4ixC7I+YaABPErtTs+SH0o8x
         Sr+a5+yp/0VepcEpomVyYbA8oj/wWZeyPYW5EGt4+Qph5KKO2DPLa0Xpa4+fMEeoAdaq
         tNFpy6xF4Y6Xlo062lDfgeiTY/nrn0Jczu0H2XFGclCJ4eMNc9AcGAfVbV25mK5pLo0u
         3gDQ==
X-Gm-Message-State: AOJu0Yy7IJLmnTE5fBBVdT+YwY1iAZLrDokYpY5bW9HncYYTXXYYH8fR
	PI5wsrOiz7DIUXTq3aFfHi8D5AyF0lUq0WfZLDmN3Ej+Fz2aBL7VAuznh1acb29Z0GBpNJ2o/Eb
	YBW7b8aCMYC9RwmwzWD0d+/iYh+wZPJ2kqMGfKcvyxJ3bTw8U+cpeGbNSnUlHvjn7RObb
X-Gm-Gg: AR+sD13u3ryjfCmBEka6mFMyBA3zfLV2Xuj2k3cgdhINhDmu3+qtcQSzvAvb3B+k727
	GL6um+trQK7BdcYjANhjhS33eEJRJ5r1leVd32eIJLhs9B6UG+6aziZ8HZV9HRUaKZXTO6a0aIB
	Fem5YUD8+wBktDN5XRHJ6ri6SmBTQr8Tvx/aCJdY+Ue92tMMEGhoj+t6JlACA7L+6FOI0tMMuJR
	8BdD0sZIeZmfzdOKVyPJPOse1sUACIjULeQ4XdpOn5I1sgObpqdZiyu7CSbPg0Qunk+bhYz2pZL
	FhrDi2en4GcMEjoBw+MNaRz2BGD9LbdBt1povV/NaUhxIyf8wPhnJKRqQ0jANo3xv5g6SHYUGVg
	Ef4naIUdPhB/CU2Kb6nSN3YZnNNCNhQew4bU5M+Xz6kVDyvtMkqQ=
X-Received: by 2002:a05:6830:3152:b0:7dc:d6b1:48b7 with SMTP id 46e09a7af769-7f196b7b649mr13878754a34.1.1785846762919;
        Tue, 04 Aug 2026 05:32:42 -0700 (PDT)
X-Received: by 2002:a05:6830:3152:b0:7dc:d6b1:48b7 with SMTP id 46e09a7af769-7f196b7b649mr13878745a34.1.1785846762520;
        Tue, 04 Aug 2026 05:32:42 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064d2esm12227013fac.3.2026.08.04.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:32:42 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 18:02:26 +0530
Subject: [PATCH v4 2/4] arm64: dts: qcom: hamoa: Add compatible to the PCIe
 Root Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-hamoa-m2-dts-v2-v4-2-1b5ceac74538@oss.qualcomm.com>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a71dbfe cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=unBuS9T_dDH4f9JXRc8A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfX7e6YswKEPAFa
 Tg/zK4KF28lKD8iIuMhXRX8ZycS76N08f4+oZgAbypEkVimHTvKyViZBhXWFJkS0UO76YdSa83P
 eaWaLtASr9kMKZJMJcG0EXFmY43A8R8=
X-Proofpoint-GUID: UbdrQgIlWQlahxHM3sC7ERg3GmYmpkiX
X-Proofpoint-ORIG-GUID: UbdrQgIlWQlahxHM3sC7ERg3GmYmpkiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfX1nsfyeLkCw5R
 sEcUB6GE4Kwk5VFUrFIeAd1oYjkjNxzQj/6SLQRE5Ilm6BOjeDi2rXe9YErdwrhb5x7aK+nG9iw
 VBvaKtScqnZrJcepEF1MQmdVwcsssVcSCZX4lWExIQ6Iw+BemCY5/KJUKCPAyC6jVy3DN3iVWsc
 lmNJVBMhYd3zWhnFEd5nMKOdUQqykFBIhjteA4xSe/WJoBzezYVwThAiyxcFd/EDq7bQYFlpcCF
 cESHivlaoCWylAIus/qksvYrKMXISYjZQbSkOrYxCC0Xve8Xb5oza2AzHzOidSRmzn/IYmZlM84
 1m7SRBVJ+hbm017OKTISSRhxMGYsFCgb0zTB6ItH8kUir/XaYBgPyJj/X3hQ5EloLpGdmoak4X0
 sDVNbtnHq3hGyPoNOEko4BGx8C/vQ3Hd1WVYD7joY1LUtaTC0wSI4HbRdF4Ye40mDzA0Rp/NZAC
 oieC8Uu8d4MpOLO9DRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040100

Add 'compatible = "pciclass,0604"' to the pcie4_port0 node in hamoa.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device, which is required for M.2 connector graph endpoint
association.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index f13e310995aa..9e81fbcf42e9 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3781,6 +3781,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

