Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987934;
	b=Z7suEQVKeu+MkUoFvsfcGlwTwb6709sZJDIRAXSKYZSAACB4a9oSM9w8gsJhG/brZ6XG
	 udJaWmI2tXJ5bV4Gi9f8+I+gpTh62iAqWkJ93iF6YXN1gjHOPkMbV8JfuMCCbMFq5mqlR
	 x+GrDSYcPImtEKDkOFdyOjDItR5N+zdDrkt6SyH42eA2jCACP3oLMUEWsRzJFi7rQ3KHo
	 6FJTv9Yg7zIUjNbrp2mukHuplvu14KXtJzRAA8+pLab/RgWfdMikrFZT/WTBYQi2PNzqt
	 x6xIQWFiMW6rAzmFQ72+iK9PtrT+x6GnCTFqhuRZH9mbBvoYd9MTAUFecXGbBdTp7oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=;
	b=RmddxfSbvflXYGS2FkgX7HlgAeByjqrpD9Lz5W+Lc9UmXuwdrEVtRx0h6KGLfMBJkyY1
	 /0qwVONnNdEpRsW7RD09Xlho0LfecvqRcaJTzFjJqiOV0hJ9RHrX/046Rfebc7dnWfjy9
	 zOYhz2Q8Y5oHcTInOPNulYF4W5qDZ36YF5+BFXxGwZyO2h5zqcC6gODcQiZZEHWz4oV/E
	 dl9FbHKp+F7JUaMEu3EXF2Sotk/to4G+w/x/K2flh9gDWQhIbuvtTP+rdsz7M0vB/3ob/
	 ozfXpc9oo5Owg1vPBt1YlOjwf520ZuMb9AfmLplYc2FHfVgmDRbY39tL37Hbje6+aPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DvhaKroK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJnWC9WW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D0D606A336
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D0D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DvhaKroK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJnWC9WW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vvu54059959
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=; b=DvhaKroKnQZwpoBY
	8V6lesU8gRNqXHOMZmmqq+ku9yhOCgUtsZHeS3E9erFPd7sul7Wa24xt/uhMEepx
	tnQvMYDTBoupR9GDq2+vnk/QgvzyDz12XbNHjRk89K3nADfcRWr0BHvAoq36yIQL
	SrcR4aiIhfkgB+xqloC882YNqw/ocxBbELuK5qaYFwrwoiT0VeF1PJlez11F9dzj
	kAK/ygUpQkqbW7Lp/Fb9qYRV6eurIQ5iSfSo9E2Bp9Pe6by9jmV/l2dG8QOeR6cx
	T86YIkZGVWpR6Vcta1+8YbjB/urERO/CB09iayWQaw6x7waisPUjROHrYPO1vRh5
	LXEuoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchwd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so113539885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987931; x=1795592731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=;
        b=HJnWC9WWe1HOVYjEOd3qjSP56oW3JP1kMuRtS1nu+y1+N87ZeFB2rnUC4tlkLJxEIS
         CAvZOHfw8l2ky/AOFwzOf3NlM5XJpT2Pb3cMVwTl+Fqicrky8CFUwfELwzNVhW33cfmV
         yI/zgSKr+ifBe7Mu2IfiUKPG3QuG4N4xHMpwmrclR8GVeAWgxQneRHBlcl7hBWMk3fBT
         QyH+OlcoTK6O94UR8dHb0qEMNGBZhcBCDw34pcJTGlVDwj+knWnQvhJH6qvsQB28uQtf
         uoV0LUiFIH3NN+8hbtE1Gvooy2fx4xoPs0liw208cxIGSecGLaZOXiG7ikItrxkGK5UW
         5qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987931; x=1795592731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=;
        b=RKJC1IDpuTUhjIUdHiakSw7pPYnAb0ZbTpdtnIk1ek2JP7JV37yVKKTG4USDdyXN8k
         vj8MlpbBkCB2UO2TGHd872XyoWIfQR2kRPt5K8q8yL6diW12cX8awnkta9sANT/d7I2P
         3D0pGp7yEencKF27X1T8PX/ZumQekLVy+X004jk7Peho1x92DpTc0nnPNtMQMwdgwXgc
         SM8a9Z4usBBLJPZ5qWdmdM+DS2ciXwSgVQ85RZZh8EjyIZe4+rNDtVjOjlp8PahJBiZk
         WcJ/cSesL7aGqlBk0H5tkPwGcYz8O5fq86GMb24GJu9XFGDCDe2PoK+Mu485xMSIRkbG
         QApw==
X-Gm-Message-State: APuU4Z9Z9nsvuDU44ATAaiyKwPZNR++GAgL8gImQMUvV+0VbRkUrUB8o
	fdAsXTPc/f4bxkw7SLZjPOfaPextDm7iRp6W28U4jQlxsC+ubWQKkt0xxY2FQk3Irs3Iq+is9HZ
	m6JK1GASGGIcgHlYIAJPFNaYHjTg3ybT0IfLvfQwG7dvMKwCbiXRWmu6kklZywGbuwm/E
X-Gm-Gg: AYBFou1MyzDGJCb3JAsQkK8Ey9BKY67S555GUF5laoOtpV1XZjlZiSZ8yvLn08+FYOK
	Em0f0+IAQh8+WWTLeMjKuvAEcgWE9NHQ/V6P7NFuKpz8Bsb24LbXOEyDTxXk/paDEQFd6CCmmue
	wInpOnYtCCftXfjUktESJEVtoIJ2C4+hIVaW2lHichQNPIaGKGaSWaAX+r6L83L7eF4fDMbBmrT
	NXCQIO8wyG54uZ1tm7sN707K13zROtGZjyZrbqo9Z+0qbTd5+opV/p3xgR4HGdZe7b6EYLT9/5s
	wN8183E+e7/6YXq6VRz3kcvHTnNSJJ1YjoMsmDsGRox6Gs/yR+4R6RrAXykBMf23u9VY3EGAKRO
	7/eAtYQudSKVjpniEAigEfDFwa76hxiEgMjoWyqoWe3XDm2DOElFzz4hQTAAJnx3o3P9na5d8d4
	T4sFAJyWQtxcujMEPKxHqtz7mBvA1v5i3vvoSy8+b+
X-Received: by 2002:a05:620a:2587:b0:949:959f:e213 with SMTP id af79cd13be357-949996be2demr311182085a.37.1794987931054;
        Tue, 17 Nov 2026 23:45:31 -0800 (PST)
X-Received: by 2002:a05:620a:2587:b0:949:959f:e213 with SMTP id af79cd13be357-949996be2demr311179585a.37.1794987930428;
        Tue, 17 Nov 2026 23:45:30 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:30 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:07 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: sm8750: Add interconnects to camcc
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
Message-Id: <20261118-camcc-fix-v1-3-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=922;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/Rz6qgPhvg0/67hfY49NLq/bi6XkxtXgxMoprPKHax0=;
 b=xcUzHlsa0uUwlwiq9Z+kd5kXzgkNdUJA2NImHLlyrkpSdr9GUZSUtuU+mtMH4Cd2VzzEywp8F
 xwzsJD+koUoAPxcTl732ZMN9RE5DwGsKVu0F072HcSZwQ7Lf9T+HDUI
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd579c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OHQEiVBeTy0qr7fm1XEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: V1DtCzIc-Anz6Ck51DH28PyltLXqU-3q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX/ZFCc0Rx6M37
 POx5S5D+8FR5hHKmtyYV0GxnHwV2iMoULA3RtHv0AJ4KJCFt6Qo65uNTSaJiIr5JOWatq1nQNrh
 o9KWlz726phCTiiZirucBr9o/XGdFlQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX+ewdgqZqNkGn
 8XezGVe6v3KfZxfRSo7HMHhwYA+eoYv1BJspQ4U2VWFLlFSQI4pvcqMcYi3OiCiqrU71tWM5d3a
 OrupBefYR90Q32YVmZDJDjUk5J4DWaV0K7TW97oJCHiJW5DfxawRotpBg4MNBPIl45ez3Q44IBK
 ZcyyiIlTA/Cxp66PpgX9BGOuvQdS/N1hz8STYAW+7QOBi8LMLe+terA8gsnlsPNVqw5izihxoS8
 W+9UwyvWq5HIhuMBkwiVtkVy2L+1c+BJNdItzd8h+kRoN+MS1Zp1toPG8jA3aYV4CT3nwTpF9+y
 9tLU9V+itkga4ZfnG6D+BB3RAHK/P5aYfDnsjpTi1WnOczEnWqQnRsN82pu9l7TN6W6S8chLN1H
 q8/X7/ungYnaNoJhJIFM9pxK+LuMR+4+uvwbxBtVwIFrtmHDCidb7tG+xRns7Z35Vusev45y3R+
 C++ByQtNO9+oNUVuvuQ==
X-Proofpoint-ORIG-GUID: V1DtCzIc-Anz6Ck51DH28PyltLXqU-3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

Add the interconnect path for the camera clock controller, which is
needed to keep MMNOC voted for while the TITAN_TOP GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb15fb1d0023fb8b5a5a59a9ed763b..9312349d19ac5df67a875194a99e4a818cc61bcb 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3796,6 +3796,9 @@ camcc: clock-controller@ade0000 {
 			required-opps = <&rpmhpd_opp_low_svs>,
 					<&rpmhpd_opp_low_svs>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

