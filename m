Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213434;
	b=ObttXDh4vlsaFXPlH/hWnDhBpuKitTJxNAujgO1k8e7k6Ih8MpNxaoX7Lg8KSyuZwKkl
	 pRM60RL0dtPSODPILdd7DRV1im67fHCPehURAHi9rkPlBCc+8xRRibMPLC2pP7WeN67fH
	 g3pXNM5KqZO3lMia+PeTxMAwbkzGbM2FStD2r0BFRJB3xDxHn9jQxAIWOF7bDVpWmwvGW
	 KukxSLQlVVfKlt8Z4fba6QLJCW5lDAYFYqRpcKe6nxDxT2DwSnh/srlUiKNrsVpqf666D
	 ncXBDUMH9BydkDBwztXXhu3QaS5l24Gs4aaWRmZJP8Lzu1iWe1Iss7nxxuqgwXVd4nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=;
	b=qOCFtj/KHJ5KnNZONiJsfSE31NOnncpc/cA2cj6kpFlXWmUsKKMurLD11+f1RWylG+ME
	 42zVDf1PeL+MzLM8UAAi9+qqu6sQpdBMNBkVEA3MKRanLZxDJ7iq9VGGJ1TFdVxQw7msf
	 2903bqtpOQA1G7nPwipLXidyWyIKJUmRRJV+CSr4eHZvbqppFa8Atb8Ajpt50NQVz4IKT
	 8JjJWxaQ73locm7dgEALmmDnY7o3a7+gUVgtfD0sCujxZni+UNhazcYC/7o9+fkYyrk6a
	 9SJha06dNhuhwYZk1pBntdu7q0zk4zINz2pMDV5UQs7k5D72hqFZXJU9ZM7j5kttuTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bugPY9ZZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ng7/9hzr";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76783606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76783606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bugPY9ZZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ng7/9hzr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969xeu3611050
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=; b=bugPY9ZZO+xDwEYv
	QOAeANmpmkJ/JaJ4BFirK3JeT5RiLehMtR0B/YBUvx9yhLxHsYWtKiW4OGdTvopE
	VNJFd9clAYs3gWM9DNWS+uqRCVRI8tn/IUKlH5NcgCntYevFWWaQR75HA/48tofQ
	JkThpW+0eOfVrvDs0MEMuf1UwHIxtHxLDkJceEIQxqlkFjKCp6eePpiM8h5M1259
	xRCFvoF5mqATBtnHWWoIYviaqjudJkk4BfLsR99fWZZQ1VaNXspLEeqI2sXsuOF3
	WVTxVGzdVM4CGUdVv64yVkpTNROgy380dQSZmuYEOCUhnUh9T3fQLFkuGTGyMjsh
	0CycFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnwvmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:37:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso173143285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213432; x=1794818232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=;
        b=Ng7/9hzrwu5BLi70fySe1RjoytG8/2grOghCbGw700xceH9CyfgervCt6mlJ7QcOOI
         QOvbWMmSq33CacOj+a8hoCA3RNNXhD9wtYeyJDKHS1D8Pxfuf/7UJGWSpLE1cCpwv6/G
         /57R3L+pv9Dvss/rWmzlaqyNx2ErIdM+C4OiKKYNA7d2MrQOKh7PSuBVXIpEP7OxtNno
         i7MFC9okHP8rhEZjZuctf1FRRKrvDU+JYWt6ZNFuqQl3mRgrak9M4smC9lyPB2/vOwhY
         kwRJhERJ7mIXBqNC11ZQomOpwI3+Xw1piMJYNkAuh+fZpY3AVsG3Rw0V/hPICjRlMYrV
         P3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213432; x=1794818232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rL3BzTsPRbdacfMmgW4kuPbKSzAfAI6zxuXuHJ+eMAI=;
        b=j62zgmEyKpfEIG+Y5dq91qj27sd/5WsyD8iKBXaWiwMnwwFHSlVAKaQtFUAC6ubyLI
         hPZScdnaO2RbnXj0n8oFaUMIOnei6lDXcm64JZ/9DgmKMDdNC5wPG5+cNtF3Z9Hkle5F
         xbbE0mpDJTQqV8rd6Gnax9bsjnylnaPVl4AHYnKFoFPg50sk59IxWfzk8ue9tJjuzJmU
         j2wBQPb7O9xnggiEGYetk3Sw53bwJG3ZIrvLC8OwfezkPd17es7PbaiYYTsGeLPR+siG
         leqdN19NsgoKIvKIDkHtjhOV5ZMI4QkUReDskUDQITz8eIHVcCvWOBtdwY/1H5dr42NZ
         xaEw==
X-Gm-Message-State: APuU4Z87rjVnAaiCWDJERct9+Xi+w9U+bphSP5gLlE0UlE+rhV4b9V+F
	/5KCs4eVETuMQrSL+TRuf97AScwfBnpyN3Q0UgpXFHoonryx81i80QnUJ6Ekgg5Xt7cs/QSmHav
	/kBCx1zoSkNmCGZ/XpCM4vOnV+0C/aLjD1wA++IUHKyJEVNT3aH0RME4myJjxmWhMGGXE1/rjj/
	ygCYY=
X-Gm-Gg: AYBFou2sE7QGawHuah/950iTg7FGxueT6F3dqE5W4QERk6WvXmFOFDaJBNa4AST8U9h
	KW56ecvgGIOUWS9QDqdMk0j+55yAATLgNvLb46P2HHw0Q7R2Da866P5bOobZi+84xpBq0D2Zq6a
	jwn7hc+VvMhGNWa0qGMMPlOWceOqS4Ag5R26Y1pkS8j/uiiCVIYivhSBnzCPPi0vsjf/WLNFu9+
	8m+8r9b7m2YAZdIorbyi32XTQ6wpvyxBI91R6EjoHXPc9Gecj0N9nQgxKZMr/DgLS9CUmm1fZQ1
	YCJ0zS39BnE23sJ1hHF59F3yoltRbsd66gBOueRN6j/UT/Ao9+HD0l1FVaboXwl+o5i7afAUkeJ
	d1eR1cJq1KBBGjd7yJ0t7BKOv7wwl5GCR2P5xJw0CL0z+LznYuzgbJtoyzwvQwE3gArPHSs5112
	9Z8okgie3Ot+39uIig4uiwfspYFxFuUsoSU/M=
X-Received: by 2002:a05:620a:a18d:20b0:947:8f05:39fe with SMTP id af79cd13be357-9478f053a98mr202380685a.77.1794213431808;
        Mon, 09 Nov 2026 00:37:11 -0800 (PST)
X-Received: by 2002:a05:620a:a18d:20b0:947:8f05:39fe with SMTP id af79cd13be357-9478f053a98mr202377085a.77.1794213431241;
        Mon, 09 Nov 2026 00:37:11 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:10 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 16:36:37 +0800
Subject: [PATCH v5 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
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
Message-Id: <20261109-msm_gdsc2-v5-3-4a3159b5e4b8@oss.qualcomm.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
In-Reply-To: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=1333;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=d8njmLr7CV+srDgKgb/TI5vSyT8vzzb8i6MXu/trLH8=;
 b=Lpc1jsqk39ukAc6Ha3p3NCpFtR4N6RWJAnPu3s7VJuOwW+CSKXIHIBpWmc/Ry+SyF04cgdHW6
 0UHN/K9ayQcDPV6pRIpXeSacvtn36fRImuv5AVBB2Fl9pDrWPlIHDX9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: szMTGMWJk_H6YBMDqXh_urOd66SNKd_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX6VeChdqvUMhm
 drpz9+5l3A1TeiI6ase2TNTBordnvdchAw9JAN63AVTXMiYqpOpAECOYNmriuepfFqYA1DXFMXa
 XIXdwFGUtyu4syhKaenA8POLoDT13QwuRGAdlC6sB+UoNe/J+fxEzne6MRZG+jU5ASccH2DD6vD
 dtqLyW9FZD5ShlyE5wD8/HKta5A+sfkXcYtGGmB9GqHvEYlNeUSDnEcBaouK5GeHhkzHbBYqExM
 plyNWuhutWQ28QiijQo1DXbZ794+4b+P+McnA4My14Di2yu2OV1NxVLBLRKjp4yXxVmZ47eTacc
 Nj9YSBYnNBuL3XEjgDVfApJygH/HsPEKW2ssdr00wvlLeUoR9cEpcxApOnf0oblKI9GEfdZmOMm
 sfz2ipgQuSsPy1HMfFRuRpEGYuSdGCAXVWGEWvEHNuosFUj2pl3Qmx1Wy7hisLtRky/abrVOzM/
 7laUSGue/s07p/SuxMA==
X-Proofpoint-ORIG-GUID: szMTGMWJk_H6YBMDqXh_urOd66SNKd_e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX5MFwFukEGFa8
 bGzbDnlqf3WAi5bWDTW74Np8oDNF/d1dZDQ1u7Ed9dw/inmxWZzdJfmayl+zJT/NlepP9uhwM47
 jT+hKQCsNUsX6xZNRSwQ8yclnbVCaUI=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af18638 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=GwFvbCpr4qPuEswRa30A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
source pipes. Without enabling it, these pipes remain inaccessible.

The DPU is supplied by both CORE and INT2, so describe both GDSCs as
its power domains rather than attaching the DPU directly to their
parent MMCX domain.

Keep CORE attached to the parent MDSS device because it also supplies
shared MDSS hardware outside the DPU.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Joonhoe Kim <26rote@gmail.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..98d367b9dac7 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3674,7 +3674,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "core", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

