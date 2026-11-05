Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873781;
	b=2UQiUKbgWwgGDNF+peNJvAn93z/wdXs3xVNVcebyHCqRE0ntHtDZq/dp00FA/wXIxDGz
	 vYRQpzZiaJHgogBA5stlDPqZ7ELEmy/6s8IplXVO2LfYEaSrFgY2bQZK1ILyj2ywJaJjK
	 o7mqjKk8Fseujbp+w/WNT+sRe+EQqgoC9FdJVYOUvdo5X4yq/LQY/i4V8YaIN3KSXn4RO
	 QAT1Vo0AnwOzm3hHqV05w2qOfeuJDQ8vxIXwprWFM3gNoioHZiyUuJxpfkjXhbbKE1j7M
	 BResXfNOXT+tdr4tKyP5wuCpk68y6A8APrL9lodGLfDJApSOApFluUzkAyk3YgXt1Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
	b=TowZdMXJeTe4rsyK0dlQKI7D0bTvjR4lI4916X8T7KP1gwRRpC+nSCOjAQlrIiThLR+/
	 uNLJSxF1JQXkRb27tFz/M2O3jqVbioOJQnkw+EhpQ3Kz/LDmtCAHy9N+QXfteH/JfxYbm
	 +XsdevTxNzFmhHAvQUVoSDGYKNBdZAqmCHwwwWonojFdtgAZVMVWiZODWdzB0qb1cldJT
	 iUrHrUYVUat9tUJM1UymTWcFDwGmKiu72b75KziiP1+XCN2uovkCM6XdFootTXSzA1Zor
	 EZHQ4Z9OFZf4tsr4qI97/cZB9GAoyAGBXrrG8IYxdwqMkroV635WDp+qUBy2Fmm4NnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dm/rrgvG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4eqyKI1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86AA606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C86AA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dm/rrgvG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4eqyKI1
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tKuE4084474
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=; b=Dm/rrgvGMH4DSLSF
	Nlir3zx3307J6xCw3fCd9n1NIa/n+sLVK18mfBvjQQ12WDY1TY8woRYsmKtFANu8
	7MRIZ4Tz65xAnOlFyf+eArVvFLG5fkuTUe4jRioo5pT653Gka47VkWXjzJ+cr9n/
	6cX/wN991s4mWBns3uQmTzajy4nkPOHEFbngA49gNM7HiLmf6kmbm4tlvWVRFeq5
	isxxeI+cppMuKbblwHKSfp+/d6XVRIXD5BPs1UL0Uy8KOVadfVvpqJEggA+H1XFV
	2IFhLuH8yFyPdQ4boXhOd0hJxgIQtb5AxMxhmhOFXJ7C7gwKkP3RfNZ2KAPdj9SP
	4H+jkQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr384-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:16:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1143246eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873779; x=1794478579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=Z4eqyKI16WMdHBK+yTWODvEPO1h+SWvk486TWVpAZThIaspsmqsGE4Y+VwkxDdFsQZ
         byDiwXP8J1DIpSCIYPBdL9+/bOHKA/b4khWSNiU5w6LCoeKUil6EqH/QYd5aK5X9aeMr
         LahqLzIys9MJPp5rKIXNHbLz73Ker02any6MLonZKXzUzeFtPVUiGBnrWu0upmsPFsB0
         GfpiN6HAFqmLCoBdVMDym7UcmDnqwiGvUezX5sECb1tqtx8EWkcrJf/8A8RX4Vy2CxWn
         dG4qsy0nDNfTh2bel3wIR7iOeV+Fzg8PkhViXuMGG0s42/tZKwfkQm0Ns7QvoL7M5zz6
         IUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873779; x=1794478579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=GF/M6nkYUybOy9VJYIuKQxFqREB2msOcup5ZHVRMsVAj2GX0zjrvhOMq1mhlFYj0s3
         LMzPxMOF6Accflm2bwR5qYxPGw3Ae4epPVMY5Jmm044Jyq+98Y0KA0TWHlscwCDhVo3e
         Y1loYFChu5bN7Q7LHTtOsxMLrymC6U8h/uN3CiQGpbDeM4uW3Gv+IC81JHyYhJhObIeu
         hxDWpLrA9MohfI4ryDLkvAyH9K5HCDN8fUEWmeJBule3xmZd0AJm1glqaMjIPKYLfbCT
         UQ7ZBZxHaHihtYvDvgVRg1RxKClRr/CvlhOcwovmH4BzjDvpGTE865EP+YEDM3MYJrIi
         HGOA==
X-Forwarded-Encrypted: i=1; AKwUvBxTFO+CbuXztWrqlFE40J3rT5ikce48Tc1nVybWtZWdEbYHHhmofiDLoJTPd+GxQLRU79mlgxgLfbnMERQ2@vger.kernel.org
X-Gm-Message-State: APuU4Z9pSdei4nohAQnoeNuG9quc6g3gO0tyHAYpEVGfN0sm+wfv2sJp
	NVr/eDYRezxCNh2wGewBVaNJfnC+1QSi3qE3CaMfrPgDwoGh9g/41P0UkEa1gLb9efiSzkudaG6
	Vi1xUt1MFYSZfWknO+iha/EqflSVInqcfSp1Ocs15GJGz7ZBA23fcaKaTx3Jc7ZSW1yPO
X-Gm-Gg: AYBFou1dNVaTspQ5r9kCve26rTmLgkC+M6yO28kCsnz0cObBfRaQncyq/44KcXPSZmA
	4shyp0s8HLf8ak4VtS7tluC2C0Rdc6CcPM9UIfyqMnGIdWn8QQfZeX4fP0bzkTB3QIMVRsXUCSQ
	LwdsrokzDIF1iUbvU/0KPDX/3eVF6GrJ07Q7XwF0rDB0K6jwrbcfgCQmsxvMAVPpzNd1A2yMqW5
	F7ez+E9cGZx5zWbs/en1TPCHREjtPPMa+p+xx7jGRHlWeEg/IHMqVw3XWp5G2+48I17IlBUIEal
	HrFOZiyZj5Snn71noPpLW5Pdh+p1r8UURKLUZP5GqMo0NTKD3VjgJEiFvmJzCMuuEp+F+gWJqD8
	lZKJh3HbujmlUJL3Y4bmTV1fsdwHSdX4vdT1SObAvXBEP5CV0EiY2s2zDWA/Z24BIBdG9/Per63
	fH
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5355037eec.13.1793873779433;
        Thu, 05 Nov 2026 02:16:19 -0800 (PST)
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5354978eec.13.1793873778588;
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17792403eec.16.2026.11.05.02.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Message-ID: <e07bf018-9a3b-4b2c-aa2d-32bb3a8db60d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:46:09 +0530
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX+R057+idYPDW
 NxHswNuXWHd5wU90LcnqwfqGE+JM8JngasQ5vCThfRUTZw3vE5GbYcau+LHOORueS7Ssn5yP2zn
 7g4NSamxMpJ/ZJMNXpaX/DhT3WAmpdqFVTWdojK8ewDSZzK7l1FcbP+jpl79iQuSy+GQLMEtOAY
 6WPGxhLe0E9lHmD5cHYIdcbYzcFjdVJ6c8pCa8ZJTdiKJnY7knEhPo5kPwlOloDyX+uWK6q/F3I
 LW67Hx0fVxjZQmHstfEhlTK/pRQePArNIqWixvJiUAcEN3IJcBBP+jBLmhL1vgcxvd+CycboZ1t
 U2/1aR9wyKikUgvoByvGsH4c3+z7hS1HzmWRDvEN/SXmMIt1rAuXOmMIK43HQRvrGo02lEr3D95
 HnYRpUJEJaebgn3t3SpAZ6aM7K/u1kU1EMCf9jhWePxI6IpjOPB668b79ZuV4aSAGkjfBW7UwKj
 IdR7wiKXuV6/URW4jwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX115FPqn2hWjC
 OIdvTAztUZilz2hPWi2xxqYmS4Ilur6gDqTKP4JHh7VYTBItIxZGxhyfqjK9MsjVPEP+kDtMoWq
 IpxaTpsuviqphXwUG9rn65WXZHWlncI=
X-Proofpoint-ORIG-GUID: EL0uoctcY2XfCdieNpnYNNt8P7Wd-HMM
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec5774 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=D307_pyVuiG9t-qGCPMA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: EL0uoctcY2XfCdieNpnYNNt8P7Wd-HMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050040



On 11/2/2026 9:24 PM, Dmitry Baryshkov wrote:
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sc7280-gp-mnd
> What was the first chip where these registers appeared? Was it present
> on SDM845?


It is available, but we didn't enable or tested the block on SDM845.

-- 
Thanks,
Taniya Das

