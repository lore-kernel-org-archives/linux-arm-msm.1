Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476048;
	b=YbiDokkbpZpYCBLLf//R1f/b7Hb0h18Okbh5ykh7M8Jy3PWyh3l5d4ynOMe/qkkqHzo+
	 n5TTgz+6KXfc5PDxMLqdvK3V1GzWlKviy0zr/FrR/OT0HBW3f9bkIuWa+gdYcGUVSc19Z
	 AtoIeKLVunvO4+z79kJFaAuL0Ypgus4v8rCMo8gTjOJNEtgHuD1uOlnoE1ESKx0NM93UU
	 oIOnqNFVB9X5q45yPSRuVXuboJH81gtVeHGRfGC2FFLdCdp1ddowZMBQMKov9/VqjZSTL
	 u9+3TOn1pmGBuJEKDnwjfor1Nv/A47ViTxc6DPWKA/X85T043qnkQ1YkYOtBKEjpRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZEMqREsfmPbH/k7JgWoRxNTtP7MVL9uGc2qOxQ8K0XM=;
	b=26m/68zgSED1b5zISdbovSOGUQ4TsYO/Ty9MIN14RByea3KYhQUufRRH1k0ksMoW2WYk
	 AfyC75hgjBpGRLuWsf95usodxU6SGBLvi/cEYu2rORAfqY9g74xjGwD+94rHezw15UM2a
	 uddplfLUTgmn1nhh2r9RGuShPX1QWRYrow/t6wFHSX9INVhxsh7K0XvHwcRcmmBzarYcW
	 jc8Kdby4MkqQJ2CDtVI9oH/gwbQTB/LQusy2OC/vFv/O0ESkAeouz3IF5dXqo2ZwnZX6S
	 7sI1gqRvh4JPbf7SOTNH6r1WaxlrxP89QVs1UkAVl5zfY1yla41TZKefOnxSwVMH45w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jLYxMoQm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R26FPh3h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D6F606A33A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D6F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jLYxMoQm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R26FPh3h
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oaTw2818776
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEMqREsfmPbH/k7JgWoRxNTtP7MVL9uGc2qOxQ8K0XM=; b=jLYxMoQmys93uE7j
	CuWvYbYPmrj1sUfJWh0gLR2ORgt4gpxUk5c2z5SxMWrfjZpHBYvqE2HA5VtTiqP0
	mgYQ37Xgum14mCK2xt/o3GtqLbxHRajXPrsMLXf4n0V/jj6Q/rwlaYcgsvYbOdph
	yObZEvvyhxFU1Q584JHKgmQtXflw75gAe3PKjP8ouo/TOcJOXwRMUiS03cU7ympL
	vdbf6ZHotCbqONNVn4oM3XYS2pNTrKdutcgBsNa47JkvgxN/qgD9uRG53SsFkJFF
	uIj02i+OFMCK9Z0TDa4J3hKi9eGNe6+vYuBhOvcRhathKOQKM6qHiGw0msgn5OY5
	g/lTYw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e18crk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:34:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so2729499a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476045; x=1795080845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEMqREsfmPbH/k7JgWoRxNTtP7MVL9uGc2qOxQ8K0XM=;
        b=R26FPh3hTODMjYe5LsIcwKRaYEOBRhFtXo4LLszzfjd4FyuMnVcoXYLnE2Hy4gXtdG
         0B7g5eSGb1YIE9Tojms3sGyIDUYK1Er2VsFWq5E2VOCHJsNQA4cjJdSMqPnqS1PkWayr
         d6SNBkFY0IVl4efDzkSYtzt3HlJrsE+8ihCsk7/12FAdyqCt7EnS1unf+V+ooWl0vhEF
         eB79NCjyjB50L+7/crLkY4PolkxLckrr2hAoc68Dplwv1WGyWv7JTnpwAXG2nYBgEbIc
         UtSgItyIgZOOI6NR4Ol7KNaJTwZe/w0IxfXEJACODxZRKeKoFfumTxH7uFy04mJsKHgf
         bJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476045; x=1795080845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEMqREsfmPbH/k7JgWoRxNTtP7MVL9uGc2qOxQ8K0XM=;
        b=ggQD9ESED5RCy+ag39MZg1bBns2YTuW+boJdSbVtlQQ6XVx9yxEeVIOJB3bKNxu04U
         scKaQBnh5hQlZFMHGuGm3J2VjtjHzJCPoqpZamyAk73PD8OIngmHlrL/hZKKAKzQRKOB
         215PVpWMAT0qH0cXL3g6wfFzU3P9WXtgzUsx0UhHQ57bhrzIwQS0Xk13rOwPPvG/W+u9
         JmqYMN+VXoNo2dZCFFWG/GI6B6JA8skP8HEfODcTf92suNnCjuEkrFG1IlHtEIJ8ik+G
         tp+gOlFL4NopShRxM48+hWfsqUMNjcEhVSktbh6TDCPhLkRB5dY7R+PisGh4Zh55y8Ky
         9k2A==
X-Forwarded-Encrypted: i=1; AL+hErHjcd/94Yj/ImKDPwBdepsyy9MrJxznuW9Fp1lsyO8lT/9fziMBgLNOMQOrzbKqQcK53lvcKbX4p7yzU+Pn@vger.kernel.org
X-Gm-Message-State: APuU4Z9uuad0eTUp/uChfvdSdwvAac5/82K2Oc20nvWRYs05623N2R/k
	VguDbUj9N1qSx5SjrifNgmtEMAa6iEWuNU6t5qkRvgMBbKsAgeUxKO5fw8TNkGJ9uWTqNcmQ7fj
	Vttcc6JvTlQRKOMGDkR+fHXoIxsbTw4N3y34b8V9ZC5FoqlnYR/Z0g+1+1GtcmKniddTU
X-Gm-Gg: AYBFou26+gRdMTIzxYo2CM9W365zEv4N9bBIqVzfSI+Q2HwEdRA5x/wlPGJb2+1JPvm
	r42Bj7KFjAPPYoQ7jxqQyTjdnvxM5teY9vzOhnUrUlRAJazQJPsxoOWJYH3IgrAeFEvimFcVPv0
	yTMPLrbgy/vGTD9pJ/us/bJgmae4K1Q/ysNLwo3oS+FY0F6drCt82ogZI0ynUnc1p4PHxArRnqf
	/rT5d4I0P/N7rtiScQ7iBrmeSN6FEVNbrmxyqlvhBfioEhK4Eg+GWkgeg2+Hmb8DCTiLZtLLsaL
	vbSNNskJBbHCscKvl0V84WUU1JbUZ0uKcRZ6Q6u/iAHsrtNwzCrp+Oi6oNtOB2DnP+TsjqHbkV/
	H63IMXZCnYRkswYoVQ4ygujQ0HL6TstMuNV4uVxRYu02R0waFrOMZlLcpftzjcjXXKCR97QdIdL
	32pg==
X-Received: by 2002:a17:90b:2f4e:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3b182f42c74mr4784670a91.54.1794476045191;
        Thu, 12 Nov 2026 01:34:05 -0800 (PST)
X-Received: by 2002:a17:90b:2f4e:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3b182f42c74mr4784628a91.54.1794476044726;
        Thu, 12 Nov 2026 01:34:04 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c9d7c1sm3881186a91.17.2026.11.12.01.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:34:04 -0800 (PST)
Message-ID: <d2315dad-ecf5-4838-bbc5-663fc2d3c75b@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:03:57 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: nord: Add support for TSCSS
 node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
 <avGHpvYV2Q6T3vwd@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <avGHpvYV2Q6T3vwd@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfXwiy9VITYbem5
 FPVroRE0iblQn9WOkQI1vHajCH1z06J8CCvi/uEJdYYLsgBphLsJfgxxK7EmQ1aNqrnXDIcffjq
 fFqKeI3AAlzYCUePA7WWQAw0IHyLNpmvO+LxManNlCmC/fIe/se/9s+ylPJx4fqUO+372BYuY/V
 5KyqEQTfLH9e6EVi2M6TpkDgcdxjMKpHtVUKGQ0MjItfQYbkiUnFzpd1QZ/26Qy2WkLknmUDpGC
 JVEChCM5jv+rIZWlgnx++kL714CNmw8L1DV3mEeRoyYkaL0bZ0RR74Tbf6yJd/dElu7gz5Dz3l9
 fOd/fsDI3os+BA8bgAkeFoYLvWGWncY/csYXly6jO8dNHvZf7ih1wkRgyuW3qH8iJ8l7yJbPo0C
 yoac0WomhVLSxZKMMNXSi8WpCnWRtPSEpVyBRsW8kc2D9q0Yin26VH8e+HiYWgfWYssrVj12i1I
 H5QyyOdK0HpAzY5neSQ==
X-Proofpoint-GUID: XcwN9a6ZRK25zQUeQj1ysqJJOXGKv5DD
X-Proofpoint-ORIG-GUID: XcwN9a6ZRK25zQUeQj1ysqJJOXGKv5DD
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5880e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_qMGny95FC9WgreSDIcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX8tHz5XVtFbJj
 g3+m6AiotCYaK/HxY7in3h5D3qdW16n0ukAyOkrm411IaDh/OgqnWseNaidR0jBMvZGOcagfwf6
 QEHK8opvuEySJyL48dD3jWFX+CT2N3Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120037



On 09-11-2026 02:13 pm, Shawn Guo wrote:
> On Sun, Nov 08, 2026 at 06:48:31PM +0530, Imran Shaik wrote:
>> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Nord
>> SoCs.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> index 1ab7d9bc3cfe..1d5f27336f73 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> @@ -736,6 +736,20 @@ pcie_data_inbound: interconnect@1c00000 {
>>   		qcom,bcm-voters = <&apps_bcm_voter>;
>>   	};
>>   
>> +	ptp@1c80000 {
>> +		compatible = "qcom,nord-tscss";
>> +		reg = <0x0 0x01c80000 0x0 0x2000>;
>> +		reg-names = "tsc";
> 
> The node should probably go to nord.dtsi with nord-embedded.dtsi
> supplementing Embedded specific resources like clocks.
> 

Sure, I will check and move this node to nord.dtsi in next series.

Thanks,
Imran
