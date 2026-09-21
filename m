Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23647C0E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984326; cv=none; b=gIt3q73hScN1Q3Mbd0NCLXz+uYrAEoPznfIzwkxXRWq0xoyGpnWzZraNAErF7sHkZBTvv05l92t11nTWcQgP5Tu+P87EtQn8U8+QtJW1KDaipOmMEQKP992nV6go1o3/C8lpQp5NUXQ+XNMzyVmvqdmPYBSuJcLct0ZD794ysFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984326; c=relaxed/simple;
	bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1kACI4s++oDsj5DoGHfsPcam+0LYngXBhX5HTpjpSG9RThZ3nmNbfwBRBUSZ5wu/EvV5Hu2vi3RRcmgbA/vbuco/jNJjiDAJQnoDulnngemfn6kkOCUvIw1SYY7GCTQCXeT9NpyaDiELjcdV9+PyM2uGVkdoE8T+L+uXhE7yR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9Nqz17H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXYWFazt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9Nqz17H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXYWFazt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79kA61458258
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=; b=I9Nqz17He3A1si7M
	R2AFVXrUMzOW7sPlb41c+hXdECCto8zFCUcH4Ps8bnLNMwTsEiC1FeEzvy5iHXsz
	nPohefKOEuZNB36FM/VHz+OW3ezvDJNEXmCnv+nUojHQHXntVMR3q2F88dhfiZ8u
	iTV1rHPFXuze790kugSMlQCKLhkd7RPbc3B+/l4jl+vj5rgP3pQPOEd5kxW+tetU
	12GV1+i6sivRrIsy8D+XCU6dI1y+07tK6hoTXPga5IbMWjMuTnJnL/nR0g62OXjf
	+eZYDE7PKxbLPXtiiDbgpnav7PiORw+ZGe62Zf2CZlxhxe1YQ1XcWZBAXnyVapp/
	oL5Qzg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v9ss3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:52:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db3734d06dso49979735ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984323; x=1790589123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=IXYWFaztSpNtUAbgWzm7c7HAjLH16Mp4lG4hAtBvelQX4B3pIk6d7lJ/+68ssATSLl
         SymHG6oWQK08dY8D2OQxzlJ8/vV2f92mg83RxVCUQzUWWPRJxDt/4gZT62L1ZSvwIiOW
         sWhY6EobUGWyh1BHkGc/+cOVlkbkic2P0EzRTuDqtqIWD4mgT5Vz5vYPXY80X5D3PFYb
         0yONZv4Kmie1QsUR3jMyogjuWRWIfFkkFeq5vbzrgmnTccTDUVcjsO+1v8vPvo5e5VAa
         MmUq5fR+6+ojol9jxb6NzR5FiQWKrIIhEcub6LNKubY3AZboWVzZxSNb+VsV6ID8LPmW
         PA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984323; x=1790589123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=dFkor1DsIoC5Hjkb/f6L4GImz1W471zYCFy47vB5rZ6izn+YtbCh6XCbQpAG5HI7Ak
         nYCl/adzWfqDjLE1/aVLg/lY7ucrkLU10d46WzdGSF3AYOQKykmrFOFXWsqj7IyqHfGJ
         wH9qzFsuqZXZ4y29tDedC2K78rsjJcLJIHUKZQT1R0GERDswsGK3BpL3OTZcB6zIta0u
         aGc7218Lza+0iq+UZ17qROkdJ8oGslRNeR/MsKqUjY+EZwobQOAJsEWabyzJAYCoai+l
         2txs//evRNj4otQ0A1tSQE7y0ae4C5Oyr1gnfwXsa+LzhUmvGgACH122uvEeGSRJ2ssI
         f1xA==
X-Gm-Message-State: AFuF++l48iXf0Es1Vgf+q3HSDT4saIOaDHLy6OiSc6xZxLw5yXrOT0Ln
	RZ1BTfUgo5+ndJI3eFCjPZsr0KscFzxtKTduCIif2x6mKxBr29GVFE6QlkA4XMYTMCOHiBzxSA1
	nSrHDbU+McTxsSdtXtu4WWCbOrdxEWGa1ILHyPIH5scBEca2Ewc7WFnEYy8RyiM234VtT
X-Gm-Gg: AYBFou2dSquhPzsx4TMyoS5Vz0XDvdc70aNdNJLz9BlHTFjWOJ9zbElm6tDQtSCusAy
	nTG+KMjXg9i0YI2lYoiWDSoTdbxrXq6lIQN6Iig8xWEObQopt7fuk50tc/+ztEZgKbXAZR2jwCo
	k1yiOGTieo0bnbrczBq8v73FYCyTJzpOb3g8qHctQ+3xEfl+1QNjkwnNFaFzCEDKbPTELzZN69b
	1Szx2efEDy4Q9eWi8LocP7KF/S+zM8F9kg+Kx0oiCTm1K/irP/daZW5ZlBnz/I+SLJQFaxrZU4Q
	3+5k97IzzsPM4TLY+OFi4HSfIc11jrRTE5nPqrKvXrsW9Va1j7YJJ2YySiiXERH0i71e6ZWh5yz
	vwEPEz11qTJCJXErAZ7LB480KGLC44p2FXwh59o3TTwG0Ey5pIqi5yIZYjhOp1KwkuOB9TfIYtw
	==
X-Received: by 2002:a17:903:1a87:b0:2df:3872:f261 with SMTP id d9443c01a7336-2df387310e1mr64397355ad.33.1789984323286;
        Mon, 21 Sep 2026 02:52:03 -0700 (PDT)
X-Received: by 2002:a17:903:1a87:b0:2df:3872:f261 with SMTP id d9443c01a7336-2df387310e1mr64397095ad.33.1789984322871;
        Mon, 21 Sep 2026 02:52:02 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:52:02 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:37 +0800
Subject: [PATCH v2 4/5] arm64: dts: qcom: eliza-mtp: Enable iris video
 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-4-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=835;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
 b=D/chGY5cdhoety7wpkQ1pRnWNNkGStMxEI/JmpkHhFbd7M9G8+zHGqc39NJ7mPtN3OnkTYc7J
 gpZLLTsbopbBE6NHV8X2WxZqV8kLPzuXaf6/P0pMATT1qs8ODW+SOSr
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0fe44 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nChROllu96siAGe8wIkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: opBkLK9BcjDP_A4zAxdyXLCxmQfAl38X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX4umEa2N/kqSR
 tc6EAgTQ58f6PrZ52CheOunPQ8BVYKUE7YCPB18XesVMwA4QWffAJPeM7t7tCkh7nxnuq/A/1yX
 /6tgWGZmiFPqG1X+TXM6a+mSLWYD0KM=
X-Proofpoint-GUID: opBkLK9BcjDP_A4zAxdyXLCxmQfAl38X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX3YFnQrhxqp89
 G3/KgsWkTK1Y+/g2kelSbLtmnoCTWKkIytjsw9z6pT9gQME0O3A7LDh+gXkgh3E1GX9LyzR2ptK
 baUEnApBU8MFC6bc/r1fVmxmbbGiY7GNOKjvAVd800aIYGJvm8TZm7ySzJ7kuTbejPdw0WSoz46
 AU1JZYelggL5+upC4i17q0WNrnJ9YVhdfNzopdhcaUjVxUE2kIGlNEjSoorsRfLE5HAvdLRNcBt
 G7q0miyOS5Z89zwE1VdLgnomCEBQDXQcw2Pu6W9LxKHK/H5xl3h9lTaBGae/DT3G87rLdr3sQUY
 iwmikiI2NW5rxrwcuVBo2Z0UYJi6gcsSMB+B7kV4ed+kZopyhLvmOANdDcVwgNR05fhwVqymrUJ
 kX6sxTSLGkvmH7BtSScGgD4Ibpv0fiZ8IT7479tcEEIax8hUaaon2JwF3UHUjgyPBR4RudJ1mQb
 SATHApsv9kWjrQdaOkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

The Eliza MTP includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb9f79cba59f11001b640a8572cc91..e5a698602dfc7a2d3ad00eade40d4f91a0cee57d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -430,6 +430,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.43.0

