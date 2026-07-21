Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B629246AA7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648189; cv=none; b=rf5Dsgt9xPwfM9SSKyft7a6t+1U1wHTlVHrcU9piaiObVVLQomlLOHp7O5BP/P0C5VzFObuiJkKJetKnUTLmbfNmkf+n2NyWWKIWgvBMrVrJI9saT4SmzPhuGUIvgcLwgFpYyLJHqTZ6d2aMhfQkyKMmRLVYT/xHsVS+CUP0k34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648189; c=relaxed/simple;
	bh=90ilvZ2uiFj9soGCmmuJZKFMtDRxEs3Q4N75AtPX8GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FehKgsDKPaD/TC6amDUMIzqLHqZtJ87jSFtKxayF5FobDbTw6L+7O2NSlRU3tuxOZYf2VhvEcZryGsqU6NEQGJJ7JFayAtM8+1ultj3zzllbTkCmjTXvWRdsIfTVl18ThLylpILXUDkIM58Ue/R3MJtD6fl2VYztp3Uc7pej+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=So5SFAed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9lNsSZ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="So5SFAed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9lNsSZ3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg7YM1805639
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37qO0VWco0TU7hswZfa/wttTjRFPaqqUvt6iWLk1rxU=; b=So5SFAedodumVxkp
	eBfkKf30+4/LIArfN8wbHOQpb844CD+UT/rejDl5cZ5sKqbZ0UL3D0+q+IcNzuZa
	zESvRy/4PEAXtmUTpfXX6kmHjqX2fcgu4BE58HJthQ8oZXXxhvc7EszHJeberStz
	7hWHZjmm0iC2sNYImTdpAj43nimm/Ki9vs7wSsWFneCPXFfKOrdKGIUmxLxF2ZQe
	zi/1xbk6rWtfdArwUWI0Xo2DFd2GRHUsOCv1RfhRQRJ1oo1twjcvRDh2V1yZDRr6
	Kh9qwj+y5JoGaTCjXlmeBXvyptUAmscBlUspwEuf9GjL0v7Gp0haCUHMNYiQ8J1u
	EZOVSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa9hkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:36:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6cb57d25so238277685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648187; x=1785252987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37qO0VWco0TU7hswZfa/wttTjRFPaqqUvt6iWLk1rxU=;
        b=L9lNsSZ3e66F/dt/pQXkMYjYvu8GU3/tku+pVXQHBSphrCMOVM2EChFaj4O6wutwTa
         beMggsi4JenJqrtXZiKAiR9P4J9BrH4WqA0de35AZdyGParzd2HFh7sUcAsC0He4v6Zq
         5i2CWbCVb+XKgpBpZsFamtww2quaxywayicN6bGdKMJPXBs4OyVmnDKD7hC04p8kJrrc
         HDIi9ugEA0896jl2IGJkkKb/Ge95gaBTdx7qU4yYw7D/aM2APZM+b4j46yHgNz6G9WfH
         KjkGBF74KD0IFE52e86GVboKpypH9Pq2l8L00cmJxExvpXgoRRH3/sVkhbmQ+JQnc2V+
         Prow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648187; x=1785252987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37qO0VWco0TU7hswZfa/wttTjRFPaqqUvt6iWLk1rxU=;
        b=MtHDWrbH936Lg56RoTG1tWrgJStPLJSJRSF2dGdzmDpw0MCIwv1KLw/ni0rawo23zU
         ogF9gIqQbkV7HNDIsqUPCobgdXnzpi4BDuP5Y1A6qnJWpMDN2G7bTshobHG94yDtFH+3
         vRy6qhVuz1zRUtsP62wLbgQoFtA8nyypWT4hDbY+YCFFyY7WDeUTcPisVGz0r3ModO/8
         0wlo7LYPsAgY/dZpc2PSpFuQrO/NrIL+e7gAxJVYIBU5WQqw7mDvgiaOPMgkF5a+e0HZ
         EfAxeDh9BOaxI4qiH17A3yB/2QPLqZu95sNb77JGDfzou2OeY9BTeUkcm1BV07Zw5MLW
         wH3g==
X-Gm-Message-State: AOJu0YxQmsdxWADi8VbY5lMwnL86geKUU9gsA5Ux2VcovB+/umO5aWdL
	zm7KEkV8urOls2Bp2Ao/Y+wdXAf/PKPdRFt7yg/4jmAQoeJWl+gO52BQ6DSjoTFbSYMkdwbOZW5
	gMkPNkSWQSwucbNaZslt8k5Rs7C123699V/+wltsz6Fjd1ZTJgsHmJbWiN6caNrN0uLUQ
X-Gm-Gg: AfdE7ckDxxfCWBblZE1ohmCU3aPzomw0dZgLRekOwq6iYB6yyeHOBqGMtUCZr5lFmEl
	ZJEEEB6Y8NVbaTxWH4cl/6zT8Eo6bkt3f5txt9TASM7PcNzYGl3Dt5nEsYqwdfVdLUz8McSmvTS
	YzVsgEq94mpFikID6aruN3+nBDxtpjOKqE4KwlWmI0cZEdr/VyA/qcLymM83tknx99k7qKTZEkw
	86vf5idBzuOKXwvGHWBup2/ZJsEHYh9T8RiUFUEKAkL+XE6rPt22wtAGGEv9p4jZRhgElFyL+Lg
	zJndTNDM5W4BphZLxE1cZU9qbuf5RPSv8QE80UR6akZwGVbZ/+Sn/wBXWi66TKCEgcK00J6llwX
	Vo3eAW2PCHSGwah7Y62e18ihY
X-Received: by 2002:ac8:5e4c:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-52674a27727mr31140381cf.9.1784648187019;
        Tue, 21 Jul 2026 08:36:27 -0700 (PDT)
X-Received: by 2002:ac8:5e4c:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-52674a27727mr31140081cf.9.1784648186562;
        Tue, 21 Jul 2026 08:36:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae04bsm607287866b.8.2026.07.21.08.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:36:25 -0700 (PDT)
Message-ID: <56522c76-389b-486b-ac64-ded7745f512f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:36:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5210: Enable USB and PCIe on
 RDP504
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
 <20260715-08-dts-v2-2-b060b68e0256@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-08-dts-v2-2-b060b68e0256@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dsk2nzzKSU1IucYUr7BupZIf_jqxq_e4
X-Proofpoint-ORIG-GUID: Dsk2nzzKSU1IucYUr7BupZIf_jqxq_e4
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f91fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ZVc07XdHWGtlc-ISXKAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NSBTYWx0ZWRfXyZUCde6AMo+x
 6A2or8fTXLLcqEZB9VLhz48/AM/yuXT/dVg0E8sZMF7e3YU0U76Rx8Y0B5tBdDqprXKpv2HJdCO
 SayBiMcvWmY6kb3+n+3IoUkoDhH0d7nTZvu4yGt54J9Q2f1AUC8ag305CLfadvrZL0M8Tbt2Lw4
 nBeXoMzi0++f95v5UlLzwod+8ZhX5mYZRadoobzRS6J7YgkxutdQmvL27B+x7qligelzi3lPXFj
 nPaTvB1k6qfXQ2bwmv+Nda+J0cNKGOtVZgsvTm0CpOx6tobUbXpfIVUUw4KZDv9hGevRy+Y5Yba
 r+mTFvanEGQLHgByCcVUbNgplLst+UL206jjKo94yxMJGBplnRKeYnNMd1wDL4OFWUh81kWph1/
 mDH6NDmUr0oIoAj3usWXuFIuLfysnRbhMouNDPb8PbExn1nHKhmXRas/5wdStxjvYHHkAjKQ0AH
 K8F1b76Pz3KEnW+ZYCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NSBTYWx0ZWRfXyT2AQZBZUQ+n
 ujNa5QQHlRzNzrHPy7fkUhd7ccQrom7IcSgBWjyROl8VU1D6+wqzK2XoFATROuuGaDOfaADYOs1
 Fh68SK0xWbDxmfcg86bM9KozKswkGLM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210165

On 7/15/26 9:11 AM, Varadarajan Narayanan wrote:
> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Hence add the NAND node but do not enable it.

Does that warrant adding a DT for both variants, both inheriting a
common .dtsi and making the necessary amends?

> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash

Are they controllable? Are they provided by some PMIC?

[...]

> +&pcie0 {
> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +	status = "okay";

Please keep a \n before 'status', uniformly, file-wide

Also 'pcie0' goes before 'pcie0_foo'

Konrad
