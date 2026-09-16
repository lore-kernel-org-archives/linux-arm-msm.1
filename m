Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A781137AA78
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571080; cv=none; b=FpGx7pgHdCpYgc3bSSa7VmQL5BbRv024j9Sb5RksLVDBxFlQvcUZPlWNZNcaJp65I41evcApwShN5x7Xmed4OZ72aEXPXl0H0owBFsc3r8tqVaMt4SWQFPawojAhCTZPFj9xnHuL3xyjB5BFWfYK1twUG1pJa2qj4JKzKolTNRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571080; c=relaxed/simple;
	bh=ML8IQx6cSEJ7UmK5TI1ede2WcTMV4WWb3D3JvR8a5UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNKxNKHOeKjyg7abz7DqY+SUvbKRL3Ij4+7hF69Qp8nLyTvPrCCKwYY45eGV4zgsH19DOQFwjjaXpE0+vprucdgZk+U5G6XmmuURjWeetEDXrfweMVdSZJM8xVYDnqnbudVOCqkVPoS8SSj5t1RNTMOeIiFC1glO6IovPwSGZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSREmy6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BSyNvq8U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSREmy6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BSyNvq8U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYc7m3079206
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=; b=gSREmy6QqGpa8K7X
	UoHtXEl4UlTysmQ6XSkMpmktbB5VACXhXK6Jxt3+m9XEjOMbRzfqi/Q+MZxuGfuQ
	WDfs/DXmRS/U2QNfrkrKwTIBXsxKxDwAtEapz15N6i2+jxl3H5jkwu8y4X4wuugg
	nA7gi+d3KkPACOOaFAblt/J/tRYn1iB9yJcNVmpfZAvQV77lk++6bIPP0vyl3eRK
	a/s3RxaacqxmgVA+0HvoNWU43di4OHoZK69lGhFIxdwPW0Sg39j2y4f4py189hd3
	KeDYAtFrOm91idxKU/t8Cr4a4Mo0RvcqgXF1Qj9yUOYO/aSZXvIGH/SwbafsRkSd
	TNtwxg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywbvgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:04:38 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45f00527132so3542201fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789571078; x=1790175878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=;
        b=BSyNvq8U+nihWuvhBfyFY8VQn7NV8IjwSkAYbnIT4BP80DAmRUwnxK+jXj4LDY4ykv
         esdKCLQFog3hy/LdqcyX9ujcoIZ+Nyi1UmsqZE5wVHtxfbjPULyok4tbocFNK8bsDhxs
         67WR9sJE1VplT5eRpvC4zhvMPEDzIQ+m9KkMGamp5x6mBHHxyna+t0hSO7KgxULDzL6Y
         /HiredyPn7viNbmSKBLJwKqEzSKwFHSHMnPjHwJ4U7AYScUud6IQkiO68RmKW2dP2POV
         sOYDY0OW5CRvgAkNwQdZDZGszmwxBYJr5eUMuEiWzGRtw5iv/SOoTMfvHI85itx3vrhj
         6a7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571078; x=1790175878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=;
        b=0SqPLsuaMFwzyVBpl8JpvYo8MDmAfkC70EffZewKThnKWsg9s93g9LOjojMwNIcdct
         A1N0hjrkqfjP00b/6k7UeSsulvlKpOYECZigbugN2eBJ6AtjM97x/c6ikOsmmm3smfGi
         es65BrS4fSdXV+SyNH6rUiSpnbG4T0e5CbMI5pSW5nKR/vBzU/Brlzo+2kqYhyNoHYBz
         mQoyniBOmMdPI5SB3YjKEJP7UYDt2m2dDbb4BwUCdCtp0A7WGk7ZkIDNaqyDWMpFMpB2
         OYqIl4b2TIObBX955NrGigFtfTs+GvwC4LA6+TCQn+ncHj1kE9ywdN2FIvW+Zq9sl4Un
         oJwQ==
X-Gm-Message-State: AFuF++mNMnQqU/deJCTYG7J5GjhNQ2NFP4A9n8+VF5fJ0qbPgNzZlnzr
	/P0HYrvkdCls/dBlDgj76+zM9eoz+HbcSDK5sfqK6R6sc0y65iIUCv5WzynrBJbxrSb5GgYGWkP
	JVksmEJx99537w0TMd2FdNenbPKYlyohai2YvmnWzU7gD/bvyVVUH6wSLZcJyFUhUFgNN
X-Gm-Gg: AYBFou0cfai3KoOrcENy1RjSTuq9LLojutST39b0jWj5RLq3TItMe6V18VGw8QjNGtD
	c61IXUp2I3wCSqZi+Wk9aVLOf75YAjVSPxOIJ5Egy6GiMjh1MhkbJnJ1h2PJfw4lOP3IT+vfZpd
	cFanPGy2A4kuuvsmrLelqaGaVWcezSwN+4HxCNKKEqiBN6VwZtG6vA9sCqvOSdeA4PNoycd/dcC
	mAbL4eELnYnRhKvaKuxR+u4SI9wTFS+ikDgkR595PrD3K2Qp23x26p89qrUB/a4qY8EeKVD60lS
	AaODBUsOdd5OdNLAWvSlTVYiig/gbneanjSnX7ruUmEsYvXHGKM4ehmU4RJJrVJV/96S41pCjH/
	v4+o5JB/t2gug3RbQ/mD9EQ==
X-Received: by 2002:a05:6808:1906:b0:4c3:bc5a:e0d with SMTP id 5614622812f47-4ca4df328a4mr3029998b6e.4.1789571077329;
        Wed, 16 Sep 2026 08:04:37 -0700 (PDT)
X-Received: by 2002:a05:6808:1906:b0:4c3:bc5a:e0d with SMTP id 5614622812f47-4ca4df328a4mr3029913b6e.4.1789571076552;
        Wed, 16 Sep 2026 08:04:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29e801cdfesm111025266b.58.2026.09.16.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:04:35 -0700 (PDT)
Message-ID: <6dcb0b11-3490-4254-b86c-a1afbcd3b863@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
 <EcOn_d45L85SEZXEL9tJYp8j2B3-IIn5Ao1OiDaZsoJZOhfDjo04cEbn_YvY3I0eidZYm2PvZNw0K2e9D62CGQ==@protonmail.internalid>
 <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
 <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aqeq85wQ6hwbFQ-i8zyzuxdrBAj0AHuc
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaab006 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=UOiVvvBnbk-lCBhJZBQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfXxmJiXdMJcDFj
 lj4yyfwUo868JuL15ybLqnoo1S5Lk6P+6hYaqlCnm+JMKXs8CufwWu2vsKoBgNi6BP1wFZQP3U3
 RTtIuCBfYCtkXgv6yg5irVy+B980V2JbBGmklmsvUIoBUCPx1QavXkW9+4p6d6sLvkLw0Mh0RFY
 u/D1cjPEezk5D6wxs8yV3+jOG+xTL+sNdsqvTZgLOAaTkjS5HBHc+ln768kKGEcN1VelPNe4Kxi
 9iJ8B4KU2iDDRo98WjnMlD13omOZ5AeImu51LTbwYO1//3m9Fw3LYjfF0GwLckaDXMNxHEgwrsH
 zxl7qjVki2UPMelkIC+HTfMvSw+l2mJvZQN908TP5Lq3ZBCeDutFV7D8k+JiTfnzrTTB82C/dhq
 qHaagIxdb7WeF/mAIWBHnnaWa2TTXUNpIMG4S+O57EXJIdqjNOzVyucIJQAxQqCqQhBtU0cD5eg
 2WK5xL15Be+YRdc1a2A==
X-Proofpoint-ORIG-GUID: aqeq85wQ6hwbFQ-i8zyzuxdrBAj0AHuc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX/IEwYh905nq8
 sHzG3uZSRGUVilY1ZDLErVo5tdKsXysXfYB2iSvDIBf7z3isYmBJJXz4TcDoxv8MbRIOSjjzwiu
 qRziYWDBzMpK0yTkyxA8+1SG+nSEpkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160204

On 9/16/26 4:58 PM, Bryan O'Donoghue wrote:
> On 09/09/2026 13:43, Konrad Dybcio wrote:
>>> +        port@3 {
>>> +            camss_csiphy4_inep: endpoint {
>>> +                data-lanes = <1 2 3 4>;
>>> +                remote-endpoint = <&csiphy4_out_ep>;
>>> +            };
>>> +        };
>> This port should be defined in the SoC DTSI
> 
> 20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org
> 
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                };
> +
> +                port@3 {
> +                    reg = <3>;
> +                };
> +            };
> 
> I don't understand your ask.

I didn't notice it was. Even more so then, add a label to that
port and override the node's contents through a reference like
so:

&camss_csiphy4_port3 {
	....
};

Perhaps moving the endpoint label and definition there too would
make sense, i.e.

-- hamoa.dtsi
ports {
	#address-cells = <1>;
	#size-cells = <0>;

	port@0 {
		reg = <0>;

		camss_csiphy4_inep: endpoint {
		};
	};

	...
};


-- x1-crd.dtsi
&camss_csiphy4_inep {
	...
};

The current approach is super fragile and relies on the developer
never making any typos. DTC will enforce the existence of the
label at compile-time if you follow the approach I suggested.

Konrad
