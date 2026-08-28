Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FB843CEFE
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920693; cv=none; b=BQbUnLpn7sDnBi/IIt3lA5yRifWAAEh1yzk55LTvqnk2ovUwg1GRB7J0IdteS7k7XsCO/Vo4qoypY60TJGzaBmP6chGl4TDFqBz7/5cYU7xjwkcEG2LkFMNoQuyU2W/imoquTW+a+XXBvwX2Gr+c+943FNTx08p4wjKPmF/VOvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920693; c=relaxed/simple;
	bh=jag7TnyI1q4HDlWokwWFeDta7drw8fsrAdCfZdrce6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0Eby0Hcc+/2tCviWNlOaiQtM/iYHnNfDi4KPFGS3RWV0ZMnWqNUSHnkp32mLQh+vlxaQxS73WuzVQnJzdxq/VV/QHm0Yg18hRxLHZT1E2GBglMy3n+C5OfB9bVelyZ5VaHhW1NWF+mcqV4E5sAxMGFKGeRI64pt5uKTdmrtZhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYwt7hrz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGHd0gb6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYwt7hrz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGHd0gb6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7cng2744783
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6v2+ivu6YsgNbWy2umeE5ZTvdaQxeHwYdEHGD5V0Dg=; b=aYwt7hrzoWnnkyMo
	AbYPVEqPE/koNxFyxpZoBgeLduiMfPfsVMN+zOBkU9GNl0eX/N9bEzlu4WRM9wKM
	VSjFZiljGpvbjnwEG2Sb3PFIIVEjvgyCjouOlc35IkQ09NBrpHK0TjCpKjkFSbBV
	L8NwtJ7of0w+yk7lzAuLWpJu9aK65Etn2JpCvx8QH8nbM4XftcLajJSoDUhAyz6M
	NXkTPRYEUvao9rnPcrs4VIpnxuxiVwO+Rv+Fy5ejvEUOfH6qmQugSX96XhWNRoxx
	yZSM8GgqI0/7H5ZyptAJhxGkscstNJjJDvW8jevaAjgb0FWFL5hnNoYIGAqgwKE+
	4Z7KFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxsst1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93915f50a5cso140062385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920685; x=1788525485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6v2+ivu6YsgNbWy2umeE5ZTvdaQxeHwYdEHGD5V0Dg=;
        b=eGHd0gb6URuYbmJRx9+0ZUHZzD64pYY+9KykCORB6c9JkdhIdrJpum5sZyBUQhvzjl
         QzuAkHObt9HxgHzsFln9h1l+gd8Fet+ctTJi2Usnt6gUjMCoKsUmakFjkkSw99EA+euh
         H+oupt+LBvT/ldY3VIr6lvjZPmZ25/QTSpLPjCumdLS/46todNy4bhugvVvNVPpUarOM
         YWPXFoOCDB1G2kR0mYGL5cH0CQtmjVq2gDdvvk6lvEaDfRQn22luKCmyYTQdf5AltNwN
         KfANzxfPnFuo+fBGaHl4pHjmkpDNgVu2EkQf2+nr97RGNGca0QwJi/zyyqpcJQe16pvs
         MR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920685; x=1788525485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6v2+ivu6YsgNbWy2umeE5ZTvdaQxeHwYdEHGD5V0Dg=;
        b=PJ8wraybK6VWHCbp2bbJ2B3xSv94xUxOY7Ojc9VuoxY5XS0rr3SuHTCed9fKbgTxL7
         0XzgPwTXOX5ocoXKKkoHz+U4ye+QbAvX0GYXeqW4A/Kd0j462A+KCKbml0R32kHWMNbU
         QsVt5Rd04QnGzcGbAgCm8SiS19jePQlMapwNUZ0+ZhBz1Sm6U+KvEGFzOWP5XGYIAt4/
         E6OJq9P+8rne1MqHDEWFA/NspoiEJvdptueaGOYfYjrKTImWQF5/pVN2UF2TX9FaU1Mb
         5PB+Xf0gcxCC79yV1cROc5iRsp0h4i/LEDbCQLng1qfOwx4gYGBH5ROQxvPnKsYd19rc
         VC8g==
X-Forwarded-Encrypted: i=1; AHgh+RrG/eqEg9PjMUdgEyczQmlshAxnk2otGk3foTzDwi/xxaXXpugn9dp9DMulosSnm8BrAHjY6IlUWDcEDhCv@vger.kernel.org
X-Gm-Message-State: AFuF++meIZtbNWJ68S54cPDgYZVN2P5/ECCbsTYBL9XyUFAwVkvbyWsx
	bCim3pwjMkX7God9280sg5wcqE8wKwkXhiDfasTaPE5j2kNJPtehjNNAft19GVtxTrJzwHYQGIC
	7NzdmchxcKXopIjBqNcP5oQOKIPxebXMTF2yWf4CgWwBngEueTae9bk0jYnzq0N0y6oEI
X-Gm-Gg: AR+sD109fluX3JF4KNyg2yjGUfcPyudBU2hcwQBg1gCQYlkgZfKcKzaGLdpeyzcWlgs
	5yXJrmiQwbrIFRwauRRvKjo8L3GudFOS0nuOT90IxeajUWmE1OQo+UYWADFyWZGL/+gQm3PAdOT
	USdjdzYLC4HBC2CZGdKQWrbUJG3yVBfY8SDidotoHdlZSNnkZlr1lX+1JRWs2ngscpEJvPDZtWs
	xeAPinF9MAGiO+2FopLGTpRmQlKrpUOh49M1IUq/PdbUzCh9VXqf9Z2z2RdWcS4AfemuAvcO0KW
	zeZ8txdTO5TixyDifw6QA6THXcUispGcushywewwznsZIIQApJt9MEQlQiLLPaAnIocUIozChPa
	+3BcTC/k=
X-Received: by 2002:ac8:5f11:0:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52fa1a980c6mr155167141cf.6.1787920684807;
        Fri, 28 Aug 2026 05:38:04 -0700 (PDT)
X-Received: by 2002:ac8:5f11:0:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52fa1a980c6mr155166641cf.6.1787920684349;
        Fri, 28 Aug 2026 05:38:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:27 +0300
Subject: [PATCH 08/11] arm64: dts: qcom: milos: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-8-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jag7TnyI1q4HDlWokwWFeDta7drw8fsrAdCfZdrce6M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYERfgHCrAdpRiyFjfOONoU/2VWqLOeu6lzOH
 uANFTO6vG2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBEQAKCRAbX0TJAJUV
 VinvEADERDVJ7oQAlXBPxTLH5jre9uXpeC1qHNOWa+xSKLW3Z2Q6fNZa1tZYBzngrzczs15UO+b
 jdBRvDpfBbBjKbw4sP1nrjtqpNLcmAAk8Id9QpLRl0lQqVD8PYu0lhK5yYbPF9IeyqCUEw9AE/v
 ASH6Dqnd8VqfSXYMNdJ728npUDIP6DdvnGztPHO0IlodUYBAT+5igACI/Zc5g3G3tYdKOzrZQvA
 s2N2kcpVpf7rw+Bqn2TXAzruvD+Te6X309bc0X3EsO2BLyKqCTyTnllYnDm5HmOtFsv44/lQdG/
 GAFMhtdiqWZDqDbDyUUuBpJp4etLS4M5INq/A3EIidhYCnzY1xuIKkN+4j37NWztbociNWExNBf
 alpSDoQ/HD6fnid3y5ZYHwyIpdQJmitIWkcufRSN54phv54MmSMnZxRF+plcd8Rd3pfMjrUJseU
 HPgmoarhvGAJ0vj3pn0jDfElDX9pKAPDQnKnGdNVT/m8zGTFZX4I6OzWHUyqEHwMX4IE12Rlw33
 dGdd/joTRwQEF3d2pAsUgrul6u59nWnxNIRWYc9uIzoup9JHtV3a1xkx++shPooAq6EcGUIxB/o
 c4S6mdkp59hI58lXP/2lA4ws7haUNrpKisizkDw33IM855OcBYlpW6nA/WU2zZRu8+zkHyGqKQc
 DNOZUPtIEu6JKrQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXwkUuTgLFpcby
 jfwVG0ZiJ067H9wIY9oaZ6kT/6c0lg7yjWN/gGg9UVlbSgsTQOWVzOBtvwqiysdD6fJO4isS016
 DGzzV2SfRaB57dsrpg/MGYaJckF5L4k1mj/gyqHBg1PWLcXfY1OQaaiXbjXyIzWPyglwMDDz3v7
 iTTeRpvyMWUI9e7iA8dNAC0qfWbVQ+672vKPtz221OsZB/sm5mHbKcXMjPtNioFPPxFb9bBEgbJ
 bMhy9KiENSAVJbNgDR3RqEYgqAkxIlubOClz2hscZZzXpBsCUcrei2mxnxYyxjMF6rO8SPnQe60
 qeaWYft8WcqxAj9bNkEro2wRvD43BgGpX5CrRwKY2UvL/oBd7jdkBWjeL3xtseLcpIf5n8FKOhF
 iHDKH+E94A7DyAsUnzwJJtInuKN6DbYNMa2qpK3nrVBB+4a9uYdpk7nCe3Kqdv7BwtFPt8N7rNE
 cmhpIaZQhTANvg1r+4g==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a91812d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX5aheDmtiWP+Q
 7k4Shvr33krsk/Zh0LQyIR6tpycCZ6wdqLtjXeIFVmvZ3vsPP5M0p2fV9Ynt+xfgvc5I0wnvANm
 UYyiPz5LERd7MVTLOD0VHS/9oO7mVik=
X-Proofpoint-ORIG-GUID: Ri0WEfCUIjrSIpX5AUEt0F4nH3DuTNdC
X-Proofpoint-GUID: Ri0WEfCUIjrSIpX5AUEt0F4nH3DuTNdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: b7c9047f851e ("arm64: dts: qcom: milos: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index bb3b67e2fd01..dbda9dddcee7 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -700,6 +700,10 @@ vibrator@5a {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/milos/fairphone/fp6/ipa_fws.mbn";
 	memory-region = <&ipa_fw_mem>;
diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf678916..b910990e2220 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1281,6 +1281,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

