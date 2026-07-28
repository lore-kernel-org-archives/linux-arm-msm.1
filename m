Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E543DA7D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226297; cv=none; b=qdxAECLTwRLL+uCp0yS+boCUlK+XHpPvUWDQVhkGtU6DMSHv9pN57IE4KMCGlLCW9hktZjbx82jQsuAlH1eOWbkDoo9E0fz5hwb85p0HDJno+3uRe04nOJC0lpiA0t6Fg1LAkQMnTUygwch1Uh/bYoJCN5kEiFSyW0FoUajYqNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226297; c=relaxed/simple;
	bh=lxycCgBRfOdu619pMjw9Iov8dyA7lRr9iuLTBphj8m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pz72dNZwB0FZGvA8D7pSEFjXGNWD4+NyDxqC26KI3L12hNSjbGt03JWcvjVgrmG64Fb69VzxBRS9Z1FmtP9sDkmUuur7BH1txKKk8BACcsUBnOn4/u31RAbfCHMMp7ZOo8w4oBrTzwMl47ZZWvdWN+9Jj0Mms3cY2xDx1It58l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leeJ6MqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zso1FJHu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leeJ6MqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zso1FJHu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S81wGC1663528
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJptslHQ6l+nT8mWDFrBIbturzPh9CDbZuwZj2F9CXI=; b=leeJ6MqXnhFBIEzQ
	1di6t4pzzoPQwiI57mSOM66FPaCnjUBQJOFZkfjN+PDQq+7or0AipMYLW+DvejUt
	gZQb0nK5Q2ezRxebRz6P/dmIFUERY+61kJUorGx9Hkrp9zNj9aYfTTaToahvb/H5
	vT2xjfijvcOmwDugyTkhDg6Ww+G3NKLiQ+KnJYr24au1lV/NjKEulJqge+mW1SwH
	4di/QeC7ZjVBBTeoyxOPIHuBy1S1sn5lpOoyZ26qa16sd4EBcLsvyRH7rmZ0A9Pq
	KaQRZoPL5RMAO6rrZmxTcheJOum3tuDyx8VJTk3oRkumeIFxeBphsp36aUkhCOC2
	umFtwQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttrgrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:11:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90786218dd0so12982376d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785226294; x=1785831094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJptslHQ6l+nT8mWDFrBIbturzPh9CDbZuwZj2F9CXI=;
        b=Zso1FJHuirGWzFNI8KRu6ta1W1DMIncdLNKAY0zinCOYKA/5aBEoyKWDpwhKXW1We1
         FXcfH0/7NEOvQqO5ns3nJlsPaS7/A7k6VhH2nzyN95xOdmBIMy7Hk8ATd+gMA1hWgDZq
         zERwE4ICFfKZEoqcPZ/sJabE1WfiKmyNEiRFqekJOCONfkTL/Z30xaNhuty1RucxAfab
         aFwsnMVIVw9Tdk5bAc6QqZNFJxlK9RB1IMuNZD3IR5tZuW0oe/shstPtI29bZMnOBBMJ
         X7lji8semko1wB0nlgMU6NNdKbJKjsWrmXMbscH1SZnYznEI0YYBqiili5RHSF7ToLgl
         g/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785226294; x=1785831094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJptslHQ6l+nT8mWDFrBIbturzPh9CDbZuwZj2F9CXI=;
        b=p0aZH39I++twiHqeDn1ctt6d6dBWzlKX1sOhBfFEi1IxOgeNTOau3mZgmO3RcDSbCd
         SZDN/s92Fk2cYCts3ywzCcWTlZYuWJUoS02UmPP+MDt3pGU1jEHpe9V/Mta9YRKbdNvw
         8GM1x8M1+wncu+goHFPLbNWSeEiKbcEuc7Q8POJP41wAXz9ytz0jops03orq8f+wZ9SB
         Loyp0q2JxLZr7M9+Ege/fnwMB9insFqUoCQX68psreUzXrAWCBPSuOly/dq1h1D1v1V4
         VNKlee/LEWXePDfBpDHYDJdzgM2BdpaBTcjE0enskuvjaLFoAXgDeIGvGs+zN4uRDxbe
         dQ2w==
X-Forwarded-Encrypted: i=1; AHgh+Rp28V7pIihbhjbdhTyNaJtrNCc2LpsQi8w41DfK4swoCc/WfI1q41HgXAItDgxaxJXR78stegmX1+PjPGwu@vger.kernel.org
X-Gm-Message-State: AOJu0YyfAIVkA28r51je9Bfl1fuIdpSnHrywXOpwGLDSRffaDRG1QdX1
	5MlDpsHwo/mKghPay6oxHLLGzy72TNulEzJII0Qai17DerwRs3eJ148qJapBDmXVjPrXAOiKmpS
	/2ehQ1fCKNTtvNXZVqKShynMiA8dBkgdj894TKC6Vkfsf+2d7Jmcr8k9C2ze/xobj3B90
X-Gm-Gg: AR+sD13VsDzTwrKvM1T6P7TP6s8a8xYsLnFgbel+z6rCL0/WkPCptAZ14uGxz+8owCg
	VS0+vrRwKhZdUDULl+vH+hsb9IvIBbaAxZEco3Uv54vtVno5JVGeBGa8/tTCncm7/LamDex942X
	5rabAPxxGTt98lKCWC6WoNwzG0GVnoTXFpxs8hMqgWysXJrwch7rKKQq59IfV0YWQTuIEF0wjmv
	VCukN86F/dkM1FXADG+gsX9ZSW6WSTlrzuAyq7fExMpu4jhV3DzeMUalc4cgbWFohTdLPdKHj7F
	1hEkBt+HN/PuqMXVCvp6zFUOTe80+E4JrEdxZtkqRkepTkhv5tIoNBfP/nTpihOxtaxKJ9VGFXI
	9assire/lyiQsdsirK/IgY99h
X-Received: by 2002:a05:6214:21ca:b0:907:c846:e682 with SMTP id 6a1803df08f44-908173add3fmr10604476d6.5.1785226294112;
        Tue, 28 Jul 2026 01:11:34 -0700 (PDT)
X-Received: by 2002:a05:6214:21ca:b0:907:c846:e682 with SMTP id 6a1803df08f44-908173add3fmr10604316d6.5.1785226293739;
        Tue, 28 Jul 2026 01:11:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5746da2sm3452087a12.21.2026.07.28.01.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:11:32 -0700 (PDT)
Message-ID: <c547f8c1-7a49-4cdf-b1d9-22f00c6035de@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:11:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728033903.2803187-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728033903.2803187-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2OSBTYWx0ZWRfXyTNr/R4RqKHI
 BjlAjUIA2yhNZLKcx7hFmLrRqT/0WGYLNBn2tzue4I9LmK0wpoQZe8KSNLasNHDVWncG2uOTsaI
 NjVJ7ufa1MKPktLUCllx87eOJuPKvjk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2OSBTYWx0ZWRfX+Rn2Zl5wVauZ
 5j65S4HD/vGVvZBgJdPlvgLRfqVzFZKiNT97MebD1wyEKD5961pMRiCKXHIqUALgWyv8Db/LXSu
 zwwcP3oQvtVrvd0eerqYObeTxynlNVwOtIwe4dUF3w3cdHQRmx3JAS7OdKbdn4nrOspUQ/9N3rC
 UJ0kqcAVyi1nO19m2UNrIVij6p0pc3eYs2aSY2zoi+KOJbgHlltoovrn6Jt82uVkS5Sby47YPj2
 jaoX4KXdAz2eQVsgqLxx3kc8YLF1DqH4aDFF2nXkUSae9YxqBe7I2nWz5C3wpmtCVCyh2fUhsNV
 RC7ZhAJRIcZInYOfCS2rk9G3TEuipsS4DhhBqJFUiSFGWLpto4hqGA0Rxvt2CNPy8WMXRPT5aG8
 3MvfVPIGxnI6TMd8iDWS4Wu4KVvId5+9BS4DsWnEXzI1s0erk6dUmJLY2FVqUobeSq2kznEfani
 3ypaaMJAc91GuhFbEpQ==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a686437 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=iuMMG4RN3S9VbU4l2-YA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 0JNn-X1I0_4qOkGZJraDCE6nBysM5dmO
X-Proofpoint-ORIG-GUID: 0JNn-X1I0_4qOkGZJraDCE6nBysM5dmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280069

On 7/28/26 5:39 AM, Wei Deng wrote:
> Hi Konrad,
> 
> On Mon, 27 Jul 2026 16:43:50 +0200, Konrad Dybcio wrote:
>> On 7/27/26 4:16 PM, Wei Deng wrote:
>>> @@ -644,6 +701,12 @@ &pcie1_phy {
>>>  &pcieport0 {
>>>  	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>>>  	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
>>> +
>>> +	port {
>>> +		pcieport0_ep: endpoint {
>>> +			remote-endpoint = <&m2_e_pcie_ep>;
>>> +		};
>>> +	};

[...]

> The concern I have with moving these to monaco.dtsi is that other
> boards sharing the same DTSI (e.g. qcs8300-ride.dts) don't have an
> M.2 connector. Adding port/endpoint nodes in the SoC DTSI would
> create dangling endpoints on those boards.

Is that a problem?

Konrad
