Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E927441A91E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572605; cv=none; b=oiBnForFRfdCD0Vg4KQP6VL6YSC4HOW5lnFOURy8JLWM0kRjzQprjET61vsAN4ckw9bLH2PrkifKmO4tDSQ6piGD4V5iB+r+tv0hL/c7wgUF4CqVJNpUQaSqDO75wl74nlOu7qWIbeinEp5KT4E6SLA3gRRL8DcSjmIIyLV/gzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572605; c=relaxed/simple;
	bh=ppqg0h8bRGvJ8cRgzX+fL/RjwZyvoIJpuivJiHXgjs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDd7PbO9A7aJUPhttCflDCUVmtSZb3jZ1awdZt7K/zdKD5XYXGG6Pv0PA1nUI3G6w+jn2jzuNhox7Mosa0KTZ1WzkO13kT5Ly8VELrK6SOSLAa10y97NuXNeYRUqGHhyLcQf+tt4nexdcVXsLCUdaDWua4pjhTiJcIkqXW9KG70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIRXpie0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1eUDlYN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIRXpie0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j1eUDlYN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMQo02743055
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwBAwiiLuJ4RoBkXKEdCItiXJM7l9fVIKsMNbws7GXo=; b=UIRXpie0WRlgVUQe
	eW4zYz2dOZtz3zj/NRvXQINRnB6OWs3hwxrVPXStu3PrrCijclhi6YDircfwBOxS
	lJZi3ZlESVn0IEactmbk22D4nzxC0oYUpOdeG4CsVx4rKf7QzldHPw9Cb69p6SgM
	6FzyhAU8JdW73CcMDkj+Wow1g7lGqqRtFENazdXSPg61xcI41RP8xTmQIOyHSaen
	S51Wz3vGxk+H2KtdMVpaPohCq+RZV7kUDqTl88yBy92dR6dnxg0DExNxxv7yYQ1Q
	DymsPlJs7KpwEXdiTBd4IXHEqNoGisMCCr/Ffop18o28q/O2Z3iVsBAHy2t0jHLo
	0BCfwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0x4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso293902385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572602; x=1788177402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwBAwiiLuJ4RoBkXKEdCItiXJM7l9fVIKsMNbws7GXo=;
        b=j1eUDlYNibiaIQHBtBgonYQUPebswlUr9QrrnT0Ht+sEhrns0JTFC2NgbD9Z7QJuyh
         JMSxsfCVr3LzlYtRmdoxZ320K+HwnE+P2+xAapwTe82yziiBIEZIEwYSCMNoUy0t6tR7
         yRw+UlxB9XwVp0SV21BMyuaWcU/NMmgzlWILMq/Mow7fULp/hiwIY9V/djla0XRcdiDR
         HL1HJwZFzpyiB7pc8keX4OZBtEVUHVmvcoPnVdzRLcYR1ZM02l+aLv44tsyKE51wNfWm
         I6cIMjMiaCiX9Qa9f87jFuSBAvqc7MxYn5c/qixKWwHYUw+NocmShRsXUyJNi5qe+dOO
         E2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572602; x=1788177402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwBAwiiLuJ4RoBkXKEdCItiXJM7l9fVIKsMNbws7GXo=;
        b=ou0/tUJWA5ioSFsksn9XXt42eoFUOky5vQoAW6K9yPcYzJoREhdszTjOtFJqFi/t5s
         GPdIuasETsB8OZ0I52J5hHnvtz2jzUceFnCmXCZQ7717nGge6IUtXYYLKeQHm12E4EcY
         LSaeaXvgci5/POMISaawPoEi7ea8bsQos+cy0Y/WE52iKZ7RDywrG2kKPWKtzlJul96H
         ImqXNhif11LJNI3f2vzVVCsxKOrn8tqxV/b/KkVVZ+4VSXyLr9mfoF6GzDEmL/TJ1W1B
         VOZuyuXr+zUXoHbUf8MvwH7ht+nj09x1RDPoXI8b++iUBKBO1/6bVqalWL5C7WFIPU0I
         8uPA==
X-Gm-Message-State: AFuF++l4aU9WEltj2a6tcCIxZDS+fNwT9jR2fgLF/6owK0zaAvEAGp2c
	CGVTeIoHkU0pn28j3jfCDGprHhEjnLgARckjhpCle1d3B1zrsZwvWozf5iO0zwXEDiV/VR+cDDh
	Q7jTOyV+erXb+DD+qxIR5J1u+4iOFTeimfWoz+Fc4uE7cGxiJrrvWZccP6azxckZ3OTLT
X-Gm-Gg: AR+sD13KoeyJs6CI7RMFJJ0U9gznYbgc2Mo1lhQoZfKZ1/saifqCWohjqm9UCJmAayO
	HCcZCFemGvqX/+J13MYjIsMrBBPuAB0ROG3yCfcLB0PD9qj5qIE6lqtxIuFcwkTNhGdptvxErqA
	RnQ8DmR2hPNjJQZdg4L1X2eOIObC7K2mTubV/fll+5hRzGfVU4zpL5LEmHj3/ot/tXrdaHjrTWM
	5PpboGoNPBjYmvtjp2psjrhuWYUx/6XxQpAxLwVfqcbjNJi5SFkTiDXjdWc9lhhZQ0QqS254DpE
	Yk7j2KhXpIlz0xj56uDJiKePuyThjRCO+s1LOgAGyXVemFiVFJHcyPcx30X9T8nlEcm2LoVYUmV
	rYlw1aVBs
X-Received: by 2002:a05:622a:488b:b0:52d:d12c:3eee with SMTP id d75a77b69052e-52df5a0245fmr283375331cf.23.1787572602183;
        Mon, 24 Aug 2026 04:56:42 -0700 (PDT)
X-Received: by 2002:a05:622a:488b:b0:52d:d12c:3eee with SMTP id d75a77b69052e-52df5a0245fmr283374951cf.23.1787572601647;
        Mon, 24 Aug 2026 04:56:41 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:28 +0300
Subject: [PATCH v3 41/47] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-41-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ppqg0h8bRGvJ8cRgzX+fL/RjwZyvoIJpuivJiHXgjs4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD96b2+Jn50WkbAba4zRzzcV2tqPjeoYU5Vq
 hkp/K3lPIGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww/QAKCRAbX0TJAJUV
 Vg+iEACQWSAFE2WJ+rAoXI95FLnw2wgT1OdsDvzgeeUNXabKAvr2vhLMC/t5m/mNXJfMhQEL8n3
 lFhkgehh3HV4rpZMy+gCswyoA4VpQs+JRGqElNyk/paUK0LAXUaamxO4lRdLJGA5o3lZPAQqvzl
 DxLf39hgOHm5Jkw0gCs+ajpjSFu+pzau1ekiCMnVsE//wg40trGFkwHhjQihH6TdhgzrS/RONkP
 WY4MgYPpQf8MbQ8eMVuBeqoh0uOHwtNqArXaBe0Twm4VyrIyWwtHBUCACN3a3Vyb+EK+L4ksaW7
 w90F/q4ihe/fDqg93kOIpb7TqRYZgWUs9i+ATn8BitwHcChRA4iEKGs+Y8rQYKi9DRpVugDzbyo
 owVwcC+T5u3whfYxMtf7UN2Ra+oEYI+kx6rbasxPTakZ47Sy8JiHFOY+rHIwD6/+l3AJKOYTDmk
 CzJFa1SYfvl7Llz5LCVbYYgEvBC1lf8NT6AFeTyq7ESy/KyU2v3FGT41oyNsbL+Y0QUdZ9qOCpw
 QHNkrgHoUxIscuTSdP339NEW+ODcxFfC3Ju9aKcak96hjwxj/zU6wwoPdwbvYQBeqAGHNDV/bqZ
 0/MqfUSBFwkKJsaTBRL5M9AAH2IIb+/MWhHDrd1CLe+peDiwt9aDoEcZkpFfhgG3uMHQNGcwSLv
 d59D7Id7WsWKP/Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX+qlNMCotSpAg
 7EC91qbFeeLkyDWrlh+zQHYT5spmyw55xPBJbikiRHz0t4YonB4o140MLdAoDtkm0WxlN2ReQY4
 bAbSchhQUQn/WoXwXIAXNIjr8FBf707+SalCtwOW/JkueoxT2fp7chvCxyeH8OzGtLYzhs1Gv92
 Fiqi7ydsc3GWExjo0ozDsTkD0w0cf41NUdKd9aq4vIauRDERt4dlgTMuyN7DY2Kzi42ulyWrsAR
 DMiM/kAx2uM8OZ3M014mGb/YF/ZamNEVRpzATNuDxlVBdw49Skak8imaIL92n+U6aPrzu7rNfYQ
 BOfAuWRf1r6QRQV36nGxOSYeKah8kOhwNGOs0CqnG6P/S7XIrwrSPB2CXiACmTvAUBq6MYZJVZQ
 gU3o4BB8MkA8m++89ky6pQhh0+4g1da8hd4CFgz6lMRbX9Qfw2HvwqvOopm7J3a5dulb3Y8y+Dm
 RSwKxt+8kLK0ynHYP2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX67rOcZ0x3+FS
 VEYFjPqYbRvbjK/lFdKqAyvzsFoGeBWc/bYsgFkZGriNS5S4aIN432M5Y+DS5sVwpitSrdDwMX6
 fr6XsuEWZ0bIYYJCat2C/+i7Jfam7jM=
X-Proofpoint-GUID: qnsg84zaTOnbnj8R8u9o9ejcjmYcmdKH
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c317a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: qnsg84zaTOnbnj8R8u9o9ejcjmYcmdKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..50790cf1c3ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -971,6 +971,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

