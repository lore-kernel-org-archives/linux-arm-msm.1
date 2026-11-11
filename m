Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383518;
	b=aTMKmAzFe1vTTvyWfJcdICW+zntW6s1rjb7hpS6p04hltSYMaKUtt9ksRrxvuXmKRCS0
	 ZrQhQQtJjbwW+ZSWWQWdnGNaWHIWqiuw8hP8FRbpnlx7W1m66wf18hdPu6SOJ1RmPrgfq
	 GGaYVmFCBF5kQZOcuN37VxNPY5BM6uetxiMYOr52VmoRrHJxfXJX6oS/Ap353uQx2hA/J
	 2HnAK5BL9yNs0aAIGuwmnnY2TIP9LoFgzOKPYy80zSDR9uTvl200GdPg40TrTzixYTT6L
	 tpdrm/HKrpf2m1WOvh+C0clvlSyntBIiNtxuwKpIPZlwDuz2ecaJqQHkVmrW4sZ6D9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT7+r0GLOc=;
	b=LBU7KqT+akpKRZoMDx1bAXWmL7RzMVAe3gBolTDbnl7Hia2bwW8EOeCiOQvOhERDWR4T
	 /dSAXYc9hylLk2vG5SLWfJi+Xgzenjh/rCPehnql5wvHhe2OxL5x+rPSB7dqLUa9rzm/y
	 fYypU3OvEnAD434U7D+hJvcqINpvJJB6wue+GNCO0/eNF7kmmf34Rrz4fsY/Vp0xuvaZV
	 BjVXE0qb7eNfbC2yUFHQLBRIK6VC23yk2Jc54wXt5DlDgGginFFffEs02bfS3nXHpQc+9
	 +uCn6PlzIJWZY7+b2uzZ8z389qKvuFw0AaD1UoAenAnYO2E9IpbfbYR44Yd37vyfoKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g6jN2/TJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ocoiuj1r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299EE606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g6jN2/TJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ocoiuj1r
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KaST864255
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT
	7+r0GLOc=; b=g6jN2/TJnKQlQ3LWHBIjulmA/nJ3InBGL9LDv2WANCxjJytwuSd
	Z2LY3dz+FlvWmP2i/illxSJ/WOKeLRvPzVxINF7/OEWKaclEFIl8/jhcg+qpBGZk
	k24ELdPMONKhUao54VpiZ5C3UlrnmWC538ym+hRimmqJ1OIitPMso6fHmB6M71xb
	qNjL/mNJzOWz1hJ+RbPpjdj03hOrU1I1LoCaaE3UNLXoD9X3prurDD4QsukDzhNv
	HcZjADIs3Ertr6jUvcH6+v5gxYmbUZDH4wHqV+5Ij2TZoN2rv1+UA9X8Oa12XIp6
	VTy2ySgG3gYj9SNcl8IDM1OXotcH/H/AVDQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawh432-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:51:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so5125689eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383517; x=1794988317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT7+r0GLOc=;
        b=Ocoiuj1r/eto6Tazxq7OR+Z18sK2NNwOK3/aa/FLuj3IoNI6fWdN+q0ZMJw/tWvVb4
         q9/aw8iKnU4+CeQ/NRWr6KQGt/HeGD+UClaWvgipHy/RnEANHCk66wwUTMnrT2VVxMCb
         FvlqKeZ8FLH0sL5Sbuj0UlbHfY/eWWvdw7ZFkedrnlCM11C1f3ARp+hJXtxKEQW7hMNv
         Fh9LYx65z9hd6qU4b05YFCU+gQbuHnJsbQorgNeaUfRJGvCNB9WmsOJsSPDpn3tfl49p
         H9j78xIFBQo/bwTeSedPxoPamS5rRe082yX9noiaUDtJrfsghW5NiEHRkRyQq02d9LI7
         5G+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383517; x=1794988317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbGapmF40loUUYp4PlJ5Iv/5btWlxr3ogTT7+r0GLOc=;
        b=rXg9HGi9nrfpFlBfS+KqKu2rF6uqRXIybAtn8SKE+ftrh5b31Rq6KxjYFkKI5v8PCL
         y95Vf9+kq+DuzTCFIjK/nH55ecKX835vZVe+bylWemfheClOJjX43Aj7Yeoe7DOQUDDD
         +pEbHYcRnXkBOugEP7SPJs8LjeFUSLFcIyD9tz08s+WXPxig4kNgmq+mvECQgDs6p0w2
         55CFpUp5BsVRC85zTRJMu0ttKF+MXNlY20zn3xPeTSuSITUavby8witR1/Q31NRdVwSu
         laQWOhIlHZLumF+MRu1Pasuz+j675hXQ30XfOGHRgypENGD43PkjHkasQ8STEV487jmA
         /HPA==
X-Forwarded-Encrypted: i=1; AL+hErEP8HXiGG/fbmrTHDwVssgh6hSYlLZ7uiLlKrsuZEUbvro3SbPdw4m8/CvjsX8S9i/Rm6sgPnGX4qp8Gbeb@vger.kernel.org
X-Gm-Message-State: APuU4Z+GpzfAUtv7cnM6L2iucWmllEVfV/wezIFPXYI6Aa2SKhQaxKrR
	FFOy83DSkf1Uve2WOOWaH2xpWokAz7J6AbJf3z0rgnVGHSJGToDIC6BU3B6zYAq98KcK41024e4
	38Ds6KFBi0rMd3E2/0CzBvYvD6BMzxiTcEkrEE+5FyzCUG1QcFVDehKBmm1Aoq/FCWLfL
X-Gm-Gg: AYBFou1rtLWl2qpGrUrUIAfGLRhrT5haSK2QMCnFR+e5t32D54gSIzJVFjXVV4LZ/yK
	gGwTjRoCMfPlHTfk3CLoHcxYiVqToN+8otE+nWCAIIy0/5YcIDaQlRcEkBcnI2bSzUMVeqc3ihH
	nao6ZuY70RRmoL3QyzYgNaQ2MpSbN3tWv/dmdZYOjHccBCyzNRv652YccWIlZxIvHxZ9rDpwVzt
	LwZ2erLHNjRzf1NskkyhdA8YNhfo/w/HOdd0mfcyXfqkIhzjTZ9jSkkdDq72qTT3gXziBakJ6M7
	cBj4/M3mf0qRv8KGxe/JnmTRbwXbAEZ1GtzE9BKDotdQkvPsMeyDitDUcgZgq4vAvaZ600Vud6u
	AwjpqhalMIxvFQVXEtRMVvUZJewZXYArpNYDyP9cQupIXAc+rbSYgu4oAyrLGkyoPa2Z21r4pYy
	t8onMTIdsVP3+RRb6h0fRt9o+TYuIRVspZ
X-Received: by 2002:a05:7022:b90c:b0:1b3:b131:6a22 with SMTP id a92af1059eb24-1b3c02f09efmr1648445c88.7.1794383516461;
        Tue, 10 Nov 2026 23:51:56 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:1b3:b131:6a22 with SMTP id a92af1059eb24-1b3c02f09efmr1648419c88.7.1794383515897;
        Tue, 10 Nov 2026 23:51:55 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:51:55 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/7] arm64: dts: qcom: nord: Add PCIe and WLAN/BT support
Date: Wed, 11 Nov 2026 15:51:34 +0800
Message-ID: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfXxq70xGQhN8MG
 K4Q8hFFY2sB7JB3IGRndKr3xHUX8T8Gr4NlcFaCFBEhH+u0dQ132116lNxSXnSTkVq0Icg0L92c
 DrsZ8X2FXOt0bvLoiTW2br0R1MbW8Vo=
X-Proofpoint-ORIG-GUID: DH8cYQwumPF9iaC4pLDKpy3KFj7UjS8x
X-Proofpoint-GUID: DH8cYQwumPF9iaC4pLDKpy3KFj7UjS8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX4mcAl1+6te9P
 rt93hax9YTjTUtvoB6VL4HSdsu3yMZxbcoJLMRvgmbhfM1U2N3TFTi1rBQvQ/Dfn6+XE1AJLfp3
 lQM4SdpJucClKUtaPVZRASdLigOGpCQWJ3zEseDC+yKsQAKeKA+QxC0HYKw3HkJUDiHZ5svtpMW
 gBStuCfk2ox1008/n08RkCLlQfWSft2uJzmE0jlIN2JZ+kIAuBn0iOLhLQqDwc4aLgESf6AMKTD
 X8cBEBMLCWAFVwlOSWCnnPDbLSzSZ11wAV9pjtADR3jy/pMf65NyPutp9/Vlg60NKe/BzNOapf+
 7uGTyFEQ4BnViMFmKpw9NbCSUWoHNeXlveRhY+f8C/w4RKFh+AO/PIJQd/Aa6hiEwQOSBJnmI2w
 rfekqQ2yAE7O+aM94Od4YhwDMm/TbbMCo8K2pPzXFlHqax6LOHXbsnkjt2wGI6ig/vmlgNpsTf3
 3mMjhZRszQf9ZCpIijw==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af41e9d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=U0NwJVSz-9pN22jjyd8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

This series enables PCIe on the Qualcomm Nord SoC and brings up the
WLAN/BT modules on Ride and RRD board.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY. The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.

Changes for v5:
- Rebase on next-20261110
- Drop RFC tag as dependencies are cleared
- Link to v4: https://lore.kernel.org/all/20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com/

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

