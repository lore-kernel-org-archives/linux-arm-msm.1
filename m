Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456698;
	b=Dus/XvzffMRX8cDoVUw55zgiAqzUAuTpzfDsYTF36hDf1//vUKE7rCkaGW76uEpyQWZX
	 EsYPC6os5PUQiBp6NcsN8GiJB7UcYyFflQsPRlBN2BzqrJ1CMmP1lFNnOFydTCwBdqe9F
	 EBp0Aifo2BD3CH4kaTw3043PdFZtl2kW3+IFOjBORz7BJHGQwbzYAKdw/CMF53xZbOlPt
	 MZUNcGyMx+gU1d94TpacVJt/AJrNleExL9rBXmwSrv//a8OICFKgV8u8H0DveRmXJ2V37
	 OUQ7apJOX7TzEqVl4PRQj0TwE+gwzSeT4mlincSC2H9ZfHIC4AVottMmMNnm8/Dj/rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX0P5nunt8=;
	b=YskvWC6PAjJLjBzvZcciY0p24zC3Nv+BC/nkIhrXaiXQBRmwTPUrqat74R0PVl8aMLRt
	 MyBD2GfHCNcVXAAXWG7JuWalf25cfGF7C2XijEHe9G4wV25BUE3aFyrzLk9u6Njy0OT8o
	 Q38iYejPIOPVfVvb3RTcnerASP08nFi5DsmHZEwDUKI2JrxPe69Uw0IkZTtANMD14+zt4
	 LhVkOtcdhMaF6vKKImYmKEvfRzZWEL3JOAp7QJ1MwwYIll1Jd/w1KLIuZtq0pyGf0PzX8
	 diTMgpYLGe3h8Jxi28tIUOCnASUv6FCYBi8U+Otb5n2EeV+nyt3mF2ibMso+YBwEPPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KoQDbi/f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDs6zhtR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FD9606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FD9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KoQDbi/f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDs6zhtR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD01kv3208395
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX
	0P5nunt8=; b=KoQDbi/fgIKSgtoxa/4x6rDVtOqLkkESWPcVGOZyUKJw9Ab63w3
	4/RFYfAUdvcum7nsF9GWW0EIC41whV2+1KuqFof7LRIjRE1a9yxNZkDnZ4oyY4Em
	A9vSvWil9q/dasjiX1dFyZC8Qk8FTP6feaHiu2RmfNWqPUpQmo5vUOUjKM1wFWEB
	0DmxnRagySfszvQt8cKvvUB7ZfRdVSMgZem91y/2uuXIrTfrkfVZmUoMRk2kkBrh
	2+fyoIwP+gJap8Q+q92B9AEC+kzWeH8VlD1jlHPnojYllUTo2UXzMdPTMmUMfvVS
	xqM59tl9/xV4yJjvaJejUF9NCbNS2AAus7Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rse5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:24:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3092552eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456696; x=1794061496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX0P5nunt8=;
        b=BDs6zhtRm9qJj5rFsI2LiKnwY9iEFcmZ7fFgy4nsWkqxDPIMEjJ1eUCRr2MH5f8aFE
         GCdPeKr7BT4SO35CaDw4wuYbgraT5hZQQGvk/HcBJ45sWdb8XH9NyAqf5sJ8FuduQMmc
         Du7M/WuuxS6hWYfeTali3J+s7N5599T2axw+KDWpitbhAtg7oorAVIBXzxyOT/yx5EVV
         RrHRouIatQwnY+pSRkArPoN6xf14CQNuujg3lk80l2pcpudL0nCJ0/tSczV++gpPx+YG
         Ywz9ehFNKH3TTaUWHHnCWbQNxtpblTbfRypwRD/Odo5wB7clQR10r25wjDW+eEH+EZsR
         m5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456696; x=1794061496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScNjaRoy9Tts1CERXXmfZfQhfRtdd+UdlcX0P5nunt8=;
        b=z7yaLUK3LpMIUkj9vcHyCQ40n+u7xm1ltDh0ASAIC/SnwJVSYyh2z9PNmEFQZ7hfPy
         R21TihZfe+9qrDwtt8Ju86YmjtR0WxkmBhsQY6Y1aggvYesK0hfQ1Ug6++LzeLgRqtq2
         Dtp+/3CFpEjt2gbkvnRW3nJ77PpFC4FWp7h8rldHPBQgZWy0izgIJEUXSDZ12PsdyEKO
         VlEKswCs0crcTjnKzQSlTrDdeA2d06FaGFDSGM4TqDQDT1MtgwCQPgjqinehwLfN1bRy
         I1BFsryZqpXcX8KIf6Nl6S95YdZwaInZf/TxNtQg/f37DqO/SrwlBDwsxgdsHnAd8AUh
         Kt9g==
X-Forwarded-Encrypted: i=1; AKwUvBxhlbaJ1Ji4wZpBGo9QE+cDZ8LvqmO9P2VYAAGpIDbgNDM2D9K1I4oOOaUQWPLi24gsxXtX+LQW2qKEM4Dt@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1d98nB8YoXsewfBW1z2rKHQX6qcA2AaRzWItHi6Q7D+OM+q9W
	hLLyI2WfK4IZTjJ/eiN7EC67QLd8ct60HWZEsRu0IDVtBiXg6WPxEmKqGx5oGnWU/mHe5jgX639
	+152JSXjBepyPGbnnqGSJVu3eYvv9u72VtBTY4PZFWNfh8usJzWIniyCdBulQXVz4OheB
X-Gm-Gg: AYBFou1bsInwDhOtPHuylBtsNvVJUXFM4KFhR460ulG9UcgE530FfScOwflVpExGlac
	LLJ34w3OBLcA/CeyWbzEQ8XTTLZgAhA79nNbBC+HiNY9t4Ab9pMZhhvdI6kT7CdrblR9wLCK3qa
	EMrvOy6Pzew/n7sObQxKul49RGQsY9G3KxccXaTG783NCCTuAoigvH9wL1R6ijBIDbLvAvIhK33
	68idG/O6lh2BMqsll+OJDRlU939GOLHilo6VoIFE76FNVXWwBPek9tVZf7M+Xa3w38GpIYBKjPb
	tGG54qGsFiRAt+1aLksC7szyGfSuS3mZqGdZ+qi3AD/2IPFwLMmbFjLSuoSGpTP3u6COS0RvzNJ
	rCEgISz5O8Y0VneX8mCieMR4lxMACpqCoVmdyswfobTbSMyCA6BxBN2g5VBXfAnKwY0ml0BU+ay
	0Um/UfHiyIqWs2OJxywrQInsnf2bieyois
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr11365606eec.28.1793456695686;
        Sat, 31 Oct 2026 07:24:55 -0700 (PDT)
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr11365549eec.28.1793456694941;
        Sat, 31 Oct 2026 07:24:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:24:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 0/7] arm64: dts: qcom: nord: Add PCIe and WLAN/BT support
Date: Sat, 31 Oct 2026 22:24:26 +0800
Message-ID: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0YS7SvjEQMqZXcwFAKtDZO_l8FU5f7cv
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5fa38 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=U0NwJVSz-9pN22jjyd8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfXyQavQhITZXmx
 8JkbPcLUiljBML2AtZBfyVHrf/cX44MX4CJKJs7LQTDURWeqyJRi+7i35KTq620lRAqAE0qUG+p
 TrcGwDurqdzmJqqXrDW5KBfmIExeFaE=
X-Proofpoint-GUID: 0YS7SvjEQMqZXcwFAKtDZO_l8FU5f7cv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfXx8OnRBb2lmxP
 qcS4lUac4Ksyo2IKnlv8qECT3k8KPuojbduU+PBfy2wm8NsfFpp26ShJtm6IVO0K1Bw8/LBL4l2
 /sutS+dJ1pytsvU1H/ch7v3xBZu2+uaL83R0uRpA0lTD6vuCaSjF1dKbHi4g0GRZiPix8qg13+n
 HPH6iwtXYc6+26LJ4BDtA1wBYCyasBOKNk3DkScPcR3jqWPSH4Xj6zGQ/WZewOWMAcI5D4cemQQ
 2K3MMAfouMheVk5dXbK+cDcHUNR+PNSgE+SCSLlQwyM7aEsG0ocBzQoKkdxNR85XDvQnPIbT2gE
 ga9jQZ6CHV7NXK/Af8dpWEeMgc0NSh0Lrb3H2GZKN6MnyZB82+9m7J+M6xX9m9f7oYr/jSQkkxu
 QYojgY4l968SEh2HWMW8fP0ZGBotdvWUeAnz/YGChKkacV5EYVlu5r3lf0EPyHzqzFpt412B5y3
 nfaJL/MMxxbasLnEZjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

This series enables PCIe on the Qualcomm Nord SoC and brings up the
WLAN/BT modules on Ride and RRD board.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY. The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.

Dependencies:
- [PATCH v5 0/2] Add PCIe support for Qualcomm Nord platform
  https://lore.kernel.org/all/20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Correct pcie_phy vdda-pll b/c/d supply: vreg_l1e_0p9 -> vreg_l2e_0p9
- New patches for RRD WLAN/BT support as RRD boards with WLAN/BT module
  become available in lab for testing
- Link to v3: https://lore.kernel.org/all/20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to the unresolved dependencies
- Add PMIC E GPIO7 for enabling WCN DIG rail that feeds the WCN7850
  VDD_DIG domain
- Drop RRD WiFi patch as RRD with WiFi module is not easily available
- New patch to add Bluetooth support for Ride board
- Link to v2: https://lore.kernel.org/all/20260915015632.283642-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Add missing leading zero for pcie_smmu reg property
- Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shuai Zhang (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
  arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support

Yu Zhang(Yuriy) (2):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
  arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 179 ++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 179 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1577 insertions(+), 4 deletions(-)

-- 
2.43.0

