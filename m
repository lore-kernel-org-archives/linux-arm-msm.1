Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788727;
	b=FgYr+wPn1lGnjglP342S25lpVrUH/y2rg2wY5HigiDbSTg/isCI2YMBOwy4r1nTTSw4/
	 4/N1LM00fBEPNgv+vIV0BGy0r+CUb+Pj9GNwaUMyu6DL7foKtKzgXM9nzyWsUBnYbhuEh
	 VAtVqGrLjbGCgaU8zRzJU4jyL0lHqpDzO318LTGNNMw20NRsmOgnaMgWVyZDo4C10vYtO
	 ZyaxgSN9chl9ZNwXK9Fax661Zpqoqw3uJ0BmPEO461oQZ8Xm5qZ1Udhn5PAViyplzC+Qc
	 BP1crAGWYAn6rtYHyqGMGR0bMldW6fwoEVdDRnkn3TPUfAM45kAU31NvEmWDD0pX+OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
	b=2HbcWVWUxZor1+bEPgyMjbL9P2PqT/9XKvpy5WuFqB6McL3gbyOjns86bbrTmghy9Me1
	 4YV+q42Moa1fQq2khOZYzdZzrDkg7KjpLirYnPxaoWLSyh84sn5JhJd/Z+qdAwQhD4hIX
	 +yeMPKh5cdf+PfiLvxgPhDY6RrJ4ETaBj6kFFVO/IOtqOiOdWg/YoTAb5M5y7bXpcTyLz
	 ETJ+SM2EQIAqCoJ1OFqpq+osN69gIvymxGBYmj/0kxK4EYhWUXtml4PsVX4IHxrqsIrV2
	 0tMiEht0NdnLfGkjPcsom0HN4cN9121IbVfmyIGsINP7M+aFbEdy8fPXlQJKWSrwHnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJYtd2Ef;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FWKwwD/j";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AB9606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AB9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJYtd2Ef;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWKwwD/j
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1H9E2376270
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=; b=jJYtd2Efx/TMqsM/
	44YSUe2TAlE+lM0Wn/MRJadaQkVGJ+rCu1ZE53uNPIoH+BBmGkD9we6/3bkQGY02
	Ctdy4SgJnz12dXnszVZivl6NdAlRlGLdpbojCZesdncurHhDyjEBfQqG4N0bEXO6
	r8Cj3x9P3ACmzlxMGzYFMMQlamzutk7AQ27zHzOPv6PZXBi0Id5uXmA4FZxuCQ+k
	YSNxKU2MWhXBQsilKx1mMPkeWdcFtT6tF7YdTZlYD4kuFPeffD7nnHcGp4O5zbGE
	Zsjir5L2bvslUuQxwS43fBMfnBsSKQNJ9jE73wSa1NJts5wRLmmAAtOR160Exvii
	R655Pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hucqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:12:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso111151485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795788725; x=1796393525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
        b=FWKwwD/jJK969UN4Fo2CRCh1Q2YKYwoS7oF+Oa3OIt415/YNTQ3PvNwIaLGdqkyhwl
         UjowUc9iBOvfi18rRzxT/27aie2QSwZGLgJ17NuRwMdIzSJVu39XS2rql82Cu1a6GRh7
         WD8WNHsT1uYyc24DYYGZ2C4YVQu+9gkutY5VSaQgu16T/n5fGp3/Fry+L5xm0zMrfuaK
         IZ8aQNSWG63jQn8/9n42KXm++VzfbYeTGSWhdAoNXpqazGWxtMw67ofq/isTEROZBVNc
         ++1FTN6TRkdFVLhkR4UdEkjBXFzJGCirOlAkGIFeUqcJsNmz5YHB51RG/hCIXTKpvqVF
         eTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788725; x=1796393525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
        b=I0zegGRKk/UKVOz+WfEYfqdqsb0plzdM6fXd39onIRTVUzzTiU47JFF0PGQqlRzOYD
         gzgzvrJXrgImg/iDaIrF/ZwuegROWTJrBFCGIe1fmGm+qKAM3WCa13UKQ5fQTpTGEKdt
         ldDMKBeJZIjP+KqJMy/lPXivFE3iSxZb1oh65I0i2qDgbGxFvxjmPGEIWBpfwBwFWCnh
         +oyg4HEYep5ShKvqEhNJTwoCQQxBTFQmKx1tHjxUReJarMsvq65xvVkxL2k50KLGKJtN
         7vI4r0NrccR5Y8VW/s/ObuNn+jVbP8JBLrn1nrBtHoprXeMUkdksRYMShp3O2HHGXieu
         nUbQ==
X-Forwarded-Encrypted: i=1; AL+hErGGPo0+CQXtBBcBoEbJhqxvhrv3hVeHaLfsT5EUgS0t8se7Lzh24rwhlc38nhAUV25ppps9cRY/Trv2/0jb@vger.kernel.org
X-Gm-Message-State: APuU4Z/zf7GEDsvwBkZn8DJgcYoJ3GX/Ui+Mbzce6YCcvTEChAIe+XBt
	UEq7b5nNLb9Ks4OYxAH0bbyMiXfC9XeoLUWszcdelB4b3xG5fToIyvjsRTU6HFEsSR5xvUp/FA/
	kLCa8bOfivi1dBCHtdJaQyNwvn96jeRl0m+fqPnPzXxmFM/vjm+I5voSlsfBIS4JuCGHk
X-Gm-Gg: AZFdTZelQamirV7o34qfDGf4dYwZJ3iTnj/nQCjQLx1dPYgafRaByMSLXPBKN6I4Fw7
	qDRjeO3kPcZ5UVpbK+6FR4OTg0yUbyJOXUTegVUw9U5QX+QZHYgiN4DZqYjid2Qs2g7hA3Ol0oM
	QVen+R8TLX1i6EoY9Y/9qv9YsRYgkir8egFWX/0oxyEXpy23ugDFfQqje3p4qzxq56ddOYzFkPV
	jvXTyqGCgUUHvKwxQYo24iyUClMkKCkFjWobuwNAz9tnPgt3UO2m3vW1DL5vfmhS26IBdbNAMwk
	BFA8knen4zb9LmqT+NjogjQ+se1djW75sXB0B0HTAnhU5tCwTYE4drKFb5PUuoB5UteSiRxaJfD
	Drb/lW5ye4LIJRpEHofO412EG54xyBpIqylDeQIw4I0nZznciDZaao+qR
X-Received: by 2002:a05:6214:4a02:b0:921:38fb:3be7 with SMTP id 6a1803df08f44-92138fb3e07mr529506486d6.2.1795788724976;
        Fri, 27 Nov 2026 06:12:04 -0800 (PST)
X-Received: by 2002:a05:6214:4a02:b0:921:38fb:3be7 with SMTP id 6a1803df08f44-92138fb3e07mr529506076d6.2.1795788724547;
        Fri, 27 Nov 2026 06:12:04 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80572914sm58914361fa.39.2026.11.27.06.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:12:03 -0800 (PST)
Message-ID: <03c360ec-fb3d-4bba-8c39-2dd476f87925@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:12:01 +0100
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
Subject: Re: [PATCH v2 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfXxA4tfDd7AWm8
 Xnq2IzraqC9b9xTocONSbHO58wbCEPgda+PInaQDk2tOvo8x2MNnKfk8/cT15bnBSmLbPCQSRal
 6vYGTuvXnd8ShGSVwKVOBAuFsGSeiwk=
X-Proofpoint-GUID: jyvEvHsLxsXrwi7liCZggOv4GzJjV87g
X-Proofpoint-ORIG-GUID: jyvEvHsLxsXrwi7liCZggOv4GzJjV87g
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b098fb6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bJUmpo4LbrwfO9ae5mQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX2IWKGFaI055k
 vHh6xDJ+/ddeIfeN7HLsFP8VCKfJi+rDdjh4hLqa1u9SihhyKj2Yf9vry+xjCQQK/mifXfk3m0P
 I0EiYudfgRWegdDwhoAsApPpZrvYbCfrOD7pf3Lj642AQsqpOWnbyI2f81Y7hey+VITt7QXAuxS
 mhubYkRsrEYT0Sm9w/p97NDJMbMkHxQK7oZPXynSxxe4RgM+/dA/t9IMcbGftGgmeMvsLH+D1im
 9KxcxL4XAfrqDUOgihwyW6yogYZBoqAgwLc8qyggXS0jDTxesBsNJnWbB0HLoP55JdEvPtOWapI
 G41reu69oeelgDZtFqWBhKOJq9bJGgc9QdMKkfpXCIs6tjHDOW8GBfVy/pSV9Owph8BFsmDcOMh
 bNBSMg93EWgiVnj8hushPcdh7zjTzXV9m6cJzBnQxVCWHXpc686xFYMCFFw2sL1JHYX0tI672b2
 W31EafZXzu/xWNTmMQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On 11/16/26 10:24 PM, Stanislav Aleksandrov wrote:
> Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
> downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
> IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
> As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
> so these are LN_BB_CLK2-4.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
