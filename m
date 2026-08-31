Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8DF3E1716
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170697; cv=none; b=HNMlfuFg1Rvm7tPzlO9FIMxkP9wLj4mUJh9Fdo7iHSSJuylPJnUw6WywThUqGbDfbcqZAn/UnHbnSMLBsvyBKKCCYUTGkBR3z2+yAAwcuNppLiGZdB+Pao7S2MoeAIBU1YGZeKd9nmjDK7HY/DbmHumOO9/qb1fXVFM+1xQnteI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170697; c=relaxed/simple;
	bh=4ZkWGQwLzoJisDVb4/Hs1Em8NoZ8L8w+xBFg5ICKCII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZ1q3RdpWGtRE4jKTpabFGATP1Pvb6dMSduX8CQ1wzUrvUKbskFeYh2xNMjh/lG36nGafYtYZXNknwXMBGG3o6mHVOnvrswsLRq7L9OcYEmLDH3BCn+n+5ildh8pZHioRWeqWFqXxSH4AnY0Xoc8DB39Yut2ZdWET0jjsgOtVD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h2UJn494; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MH/EEPJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h2UJn494";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MH/EEPJb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xZ4G2924381
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0bJzMsVzoyAH5tEFDsb6W73BPbjdjwL7QyK7W0rd5A=; b=h2UJn494TlD5Gm8p
	pOsBD6fZ4mGQn8OaC8X/JVoCGchWuigR8frXbPj3IkEoicP/AROVlKKqKCTC/gt3
	bPsw3EUtHsGezYSt4WHvyPvjK/3sNcDKrq5CZ6G5BK5KyT6NNWw+usfu8RoixcYk
	zar9XVdUEGPGGJQXvMo1vozxlzKhHBFcLYVvnS9UB2lNW/N1kiNzABWCTuRBNroP
	0o9gCpdiWCGUezCFzik1p0ozfcgiZ79XSPE2YD8Pht9H7Wi2GTQrHhLRt7Qwzuef
	BwzNl9Z7amcTqeAoVwz7u8OQelIUQ3O5RalC36FoJYncmoooVvnqNKfnc0i/SPC3
	oWeF8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wa4jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:04:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso434239985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170694; x=1788775494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0bJzMsVzoyAH5tEFDsb6W73BPbjdjwL7QyK7W0rd5A=;
        b=MH/EEPJbLrUb7pKae5ocbKPBdxkkQ0Mq6GB7ddNwguJu+G9/biqQ4G/47OMzWbdJqA
         LaWYuiKynlUH+ScXqWVHZaZnpea5cczF19BXuYQ/x8ysT/T6qseuS0Beain/NIBEay9J
         tGH0X7jVCF2dW9T+9UMNNibspbRz3vIJGRfDryhEFLSJxdn2p7SoLQKPBKmeVdgdS2rL
         mu6V+Sk4jCHgEgQErpTZIy3LZ/bZ4BIMFYG2hsdSlDnU422mYef/PtON5dfSnPTg5RDx
         2D1pOKfwntk/UtSVPREflEthkHxR0ooMgDmkWLE5PGMOYJe9KOdWBI8y6W+/7w98SYEQ
         TLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170694; x=1788775494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0bJzMsVzoyAH5tEFDsb6W73BPbjdjwL7QyK7W0rd5A=;
        b=qfDp2rMarvE9x4h9symipKH5u1OFb4fLrJGe9WMAuV0bKPjTYSCs82gA8YKdS0gsah
         h0qf5BqIDNcjKY04R+ZLraMwCTrhjwDmMkNj8nYWAxB9bmGYg8pursoQDgCDwy3q5ShX
         XYiSGS4E8WqCEEp//FSIq4wG2ZXPWwg7Pf1fm3xQ7EDFR8gvylUpNU0F0/lnbEr3sXE4
         VVJOqAjb6UmXoHV3g6K8+suBwrMP05HFBnMq+VMFxcSNJa6qHZZKTrE85ssJyTzMZACo
         ei+ERKGLBwId6852+Gcgf73hvMorJARXU/8UZaHc7dQJXlGR7UilQhMpqeunn51wAl3t
         45/Q==
X-Gm-Message-State: AFuF++mgUKQKMfGCeiWdibsSWTOu8ReiihWXfI84AMzAUFsk2hAqoNag
	tCAfxuEAvT4L+PWmmlFx+lk1tLBDfF8j/u+EZRoZWcNnqDLqZGA56JZjLxDLzGYMByomaHy+1cO
	YTF/KJ6niz3veUUvnqEFQAUrfgcrCsZ3E5bOorKh8WjT3sW5OJJ/2W5prXLpREj2m2vyX
X-Gm-Gg: AR+sD12xYArTUvJlJb1ksAyzJIlqc2os77e/DDe99j9PweAW2ekK9Wi8ZZ7Ft3Q57EO
	/wD2/rwOZ6C50SeF3aD1DQF+AYD94lB9Jiona8E1JMYURDaBmp2k0CaFbZBxre8MORtpGZio/mc
	LSONLCfqTcRlJlfmEfrTpBixdHb6GF6VvM5Moew8X6lJxZMJTedkouw62OLkqSsr+8oSErqd62s
	F4on2JA02E+wym3guwFjkwkxCUVd+/luL3LqUi6VbX9BpjtckgWGFWKfZ62GP/M9gMUohNjEdj4
	//pUdkrnrxAzE1jrEbHXmv35a9ogl7bbw+f/moKBX9CiPglvj3yE0Ihyd6eIJbSFsXR3vR16QFg
	J4e3iqw==
X-Received: by 2002:a05:620a:2591:b0:939:ca4:4d5f with SMTP id af79cd13be357-939137496c3mr2742561885a.5.1788170693749;
        Mon, 31 Aug 2026 03:04:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2591:b0:939:ca4:4d5f with SMTP id af79cd13be357-939137496c3mr2742548485a.5.1788170693132;
        Mon, 31 Aug 2026 03:04:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:04:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:43 +0300
Subject: [PATCH 3/9] arm64: dts: qcom: x1e78100-t14s: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-3-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4ZkWGQwLzoJisDVb4/Hs1Em8NoZ8L8w+xBFg5ICKCII=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVACYBcXkNwzazhD1n7+4lHx9FAty+gFC1xKQ
 z34gcdLvQuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQAgAKCRAbX0TJAJUV
 VjhcEAC0q1vLrXGmcITGrwu7cztlRvyR7hF5ikABMMdJSXN6J4iiD5t9ghRr8EtCm+pmijw7RCe
 Vu++HQ+35PuZVPNxHLk0X2DNO24tuCivbQ+V8H15F0pU2uvUnaTcDt9KpgFjQurtjdNP5AnfNq2
 Z3TI3FyfoIFF6qn0QcPVcrZFhE+YAXlQXbYRCJ/567wv7HxoN85gEHn4VVfjmIroA0p1+WVDi9W
 tTQfPpIMW/2eqz5jwZPIWIKH8mgnDT8Q9JecRMlsnEIj8o5OGY0izUgEGGvelp7pPdRUZnSv9p4
 ST2n8+66KXVmZUo8buec9q4URsYHsDZ/ien5rEmxEe1/6LsWAtI/xoX4JvIkNZNs/q1R3hvv0Sw
 2tFJ0CAbTA4qlEihtIprFGY7uJlC4K21rugavCY5GMjeozjTpbGbMiZlcJYj5hSAwgXKNLXZzi5
 Z22uGf83oWjds1PwgQURNWLAB1JRJpZkjXTyCOBkf/uKqLMUqJ1lWU1dMe3ayxNxFupWs8ajfM0
 YgTvbTCxyQxseut1rUq47wBDgQMkSvh5/ezSVwZP9yVfnwMrpIZWLjABs4xOiSxCszl5o78pm0v
 2VufKJOn9ahOWMKtna3iLo1hIHNm4lx/O1wI334uHFnV94uVtxdTZPo22z/DARgX8Kgb0P3UfQO
 ZP5B5DwpejNtYzQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9551c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=l8FgSqmFWaqY7FSYhIgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfXxJZ8fVWAhiK4
 mJYvqv59KEjdFoCMWNEhb3RkghLc1ImMh3RFFnO9gwFmE9jxSL/M9rl0JQNxWVsDJxRaVqoUtar
 CgSLd1sBoD6a5KCU8MbQ9ZSbCqgmZ8w=
X-Proofpoint-ORIG-GUID: YeaiB0xFRtY5F9JFvWH_psk8e-yYBN45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX5enTXJwqi17j
 vBYsqlmKVqDL/7CerN71E4UAV1HHQx6mGZrBsEewIgKJxJT4fMpNoML7nvscBJ5vft08ljCYX7/
 TKD30VanSM3OiRB6sFpk+JdEP4AHYq9oewWccS3ina0zPyPyJqhtANy0i1MNzB/9wJ7nNEmFoj6
 CXXUBFvdsCwAKxGFXHk+atLslNWwROfhqm1nwqkKPAa/wYRyfIYJn2/1hliiu6qHozsKO80mDRv
 WeD2nexIbNSNro2qxGi7xeO60FHyUyuGjVxrwiUyn0yfonr2T1u8/z7bv7liMej5jcnXP+pvnz3
 VkyvMNs4CdrU6FBbS560AtOeHSpt2i1f7c5oNxSnbzQxSZaxrPPUwXnW6UMq5LjYWPjZi9YzyHW
 SoUvef1gbMWroNF0vQBw0RBvjwgNqWjCqfjsQ8E3gUJi6Yvivx8l2uo2lN7lVmr6WvrMr+3Owal
 ovpbgDIiAEskNS8mB9Q==
X-Proofpoint-GUID: YeaiB0xFRtY5F9JFvWH_psk8e-yYBN45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 0bee2a3d6e7a..8f7b01617461 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1385,6 +1385,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0

