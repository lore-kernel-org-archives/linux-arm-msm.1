Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471539;
	b=V2FyDRdNjVWsNPC5To79sdz6aNtNmc5TUfTYV3mUqWBNg/JidXYjOY2fkTxoJwIww8uz
	 rijWaf+UGWcBPQGb0mG6bFAXnyGDRyYktYaJI1lMBbMPRIBFtuA9bhnpWFktHrNb10olh
	 d/7IIphqdYM3L+5XrCGMmVp6EbAaXR2ba21dOYa/qCHgPg+6WjVyIGqflSilme5p0qoSJ
	 qrMCqkd9y3eTaEx5+9OuXQN2WsXJFHD7sX+kGOxB/LQIwiV0orP2CfliPa6VzqrEpbJCC
	 mBr/4bpqLYsEqRGxpA0DJZv7+qrRSQ3mZoVBEaXxG9f80ilZcMz71t4+IQZF1/piBPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
	b=3mAS5FarnrMnRwd4E42VQadcar0i/pws+DfoWKMxbf2wzw7cb2x+mu9lXB20465vNIBf
	 egGe2xSpJL03lVey83DyCh04IqPfUkFQwOu0Zl388DkEIAlLcGuwsuNTxYPyFlTk9or50
	 nNtgAFvdSh/+OM7MinBRMlVBM0d2Ok8Glaj0ikA7QhkAmpSqZeTPTVA6I8/sjdfBxyjjQ
	 EsObo7VzpFf9vC1rQ65YYBf8QmV50Clw8bxVOaMnYtvaMeSdJRytAQ7m67nIpnVfjRzQp
	 NCkZtKTZzMxqf4p/lKHCImv1QyxFy/oG5Zd4SqWvbRZQqLD7htVGos5NGUFX3Xtzuyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oMYk/6eC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfIHwB8e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED3C606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED3C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMYk/6eC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfIHwB8e
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuXdG1332752
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=; b=oMYk/6eCMHBpz52z
	pxjsUACx/yjdyR5Na3Y8lgC9d6C3rzIA3YPT+aq9bMLsCAaO2xsqUrCU72fK2Rpq
	ravGaf4kufhebKk+JywQbnhuzTodAk2WlM7uU0zo+pMG8nwpgONl/GZ936HeTWLD
	FXrxffHXbElvhoolh3X96ZOBorOZZNKD/vRx4eNmebmgR1MacomARN4CBT54ifi/
	7arjReUqUf+Jj9lQrS162Y/uq1Z9rbOrx13yEww+aNIguPai4M5UZ3WEdPLR6H1k
	upjPHIW0VuVeysy7hevmkjzZe51l4g8uvrtc/O9Qqt6yZJY6OP09JE2mBEVPnlbe
	zMAaIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g743p6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:05:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fcso680056885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471537; x=1796076337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
        b=FfIHwB8eC45XW3nJK8rlR2hRjhfNi14xddoPI6f/Mdmcgp4CZ3zxepPn2/dEwquhUV
         plXJ9BTg4OjMDdNRAMGnTT3mqt+8cYblwgRVX/973o+8PlbPLgsWUwKS1TZUxMw8n2eD
         cNIKUTjNbzFgbfJpXhhahSSuW1P37Oguce0ZQoQp70RZQyG34kp7yjE8VErTLSho4diW
         rq9uenBaFSyL577DNgOCHdsBtyxKsTUeUdgLzYB88gh142IgCdM3LaM6NH0sAa7zIhFs
         gav1q4OxCvOeixqEX/YBmyNe3R4Tw28reWulRy61IDjZ2rvwpB+FQGPqizqUyVt8Gkoq
         L6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471537; x=1796076337;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
        b=ErmySRKKJRzqNz5Kx83ozrXw4KrQxCx3WSVbK0WNoGXUr1BC5WWEaU8mp/7FH9SdAX
         SxkjauTRRrz9qG+U4gSYsE/GpvQW4JliQ9dKRvVlncOVwCMX2l5jNvWQL6Mpgaof+uuh
         J5OuAlmiSDM2I1uYAi1XbQOLD6EnkDu/f68lQe8bF5cBVlFYwXFkMZ3k05lTS1cyFDpJ
         1EcaJ+Yv8W67dsLyhDq8etsODWBYsqk66x2f7XsNihaSvTgcCLWozQRlYRF7zaK1YoFJ
         XBbd6vmng1l1KmMkZO/OWa99WXUSS+ZNGExE6icE6i43sz+FUqQmmcWbgjbvjV/uUHDL
         n/dg==
X-Forwarded-Encrypted: i=1; AL+hErHKyp8wczg1DgXcZQd5GlgmlbNiPEDwcWAZu3o09+93/3Wy8+AioivhQrDrQOqzGVfkz9bXoor3AIYset1V@vger.kernel.org
X-Gm-Message-State: APuU4Z+J++HwvLf7NnnUujPaNb6hNHiadhdWtW3mOrHmKOPDsPBTzOSB
	FdTJiCMExTZlfTS8CCPOM0/Y4tOtFmXIEhZ7XwK5FKahm+C7kZ9106sMmDNSb3AqtpEQYDisgy3
	J/hlU4JcGLRkPlm9s0WeQQ59KKMwpQMmw78Qc+7guO16oat3CyEpz5D3uN+w0hRixA7O+
X-Gm-Gg: AZFdTZeFEhLzAUyGeQCfzED05SdSAPfL/CEQf9p/nKLMQomU9qP44difwHdMyB2ub8F
	1cbqDfAmSpxGuRfIQK29ldRJJuKG5QUj6eaJbZt6S9hw4zdN4PMVanRjQcBARF4SwqsWHibGSdK
	bsMxu4HoCVd16lTgOV0byjxq3BO8m2bxGfZLh6OJ5qLKfBHsy8O7MIKaMfIloamddTVQ9N7+r64
	cVoRH6KOGsOVMhc6sgO/V4mfKEP5tsmQapca2Tfau092xP2xvemIJKnGxlX5em+MRfq1aG55Alh
	xdd7/DtxrXHW4I0gMV/WSLnRblAhoSD7INJPSLn78dx/lJQDuJMcxvM5asGg3FCmcWeq87aRg6r
	8Epk/dYXQJ1yGYPwfY3hsI/YPhEh5hZuP+EMs0wBmiBAHcl0LlRnZbllhF0N+GtorZbpR5nqDFj
	Q=
X-Received: by 2002:a05:620a:4495:b0:944:dbd:8253 with SMTP id af79cd13be357-949baa03d05mr2138288085a.59.1795471537370;
        Mon, 23 Nov 2026 14:05:37 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:944:dbd:8253 with SMTP id af79cd13be357-949baa03d05mr2138282885a.59.1795471536895;
        Mon, 23 Nov 2026 14:05:36 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm708892455e9.4.2026.11.23.14.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:05:35 -0800 (PST)
Message-ID: <b1c75c62-1b44-4ab4-8bc5-688762bcb8f9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:05:33 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UpKlbtr7hNNVRLu9SBnVYwwCde8Ld9fw
X-Proofpoint-ORIG-GUID: UpKlbtr7hNNVRLu9SBnVYwwCde8Ld9fw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX1axWWAgaM9fT
 02ZkdaG5DRzPQLCiUi8cob8zbu2dMcmRY9eu+k6qJlpWe/xvMNk3bsayFs7xPrYdaDlqhN/kNug
 GsQoqMAduh4U6kV2sk1LfcT26iVT2lc=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04b8b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c-T1lRSgfK_BPOqrbiAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfXzaiHhIKCKwsy
 yRp4/hup52bsg5L766mEV9RlS5EalMe3CGFdS36FOrsgMJft7QpJvMjoud0X4UzBk6R8AeBr+rl
 hDPNy7/Vl1PJ/MaMjspBVmfZzNjF5bS6JUJCG4wTbPs9dFhXSob30n5KwJjQpIvKaIdWDKIa6zt
 5fT8CrSzgjYqKO1eRBLTxCDakSMIj6zJDNSGtxSLvhWjPpyT9RmzoeQoEN/Za6n6SFAaTboRFwc
 ATjBTdmajIVMyDrdPezSWkj9cPpq3iZynT2iaG5K8nTL/bBTXSp5cpLDYXZTCh6rMLZizYX2nRf
 b9afEfzxAnIEmtr2OvOi7PnMBuL6m/+y2RnS89lmdLOoojgbazv5aRezm1V4SF+XTnwABJQLG8b
 BhSXcQfEiG9dZKRau3mAUE2wfbYRXQeQslbuzWoIusLBiD8CXWgDavkCheU/7xyfWI4oCMFU/Sf
 zoC1eIMbF+IW7nVnxyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230087

On 23/11/2026 14:34, Shawn Guo wrote:
> On Sun, Nov 22, 2026 at 06:46:21PM +0100, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
> 
> Same typo as in patch 1.
> 
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
>>
>> Driver have local copy of these defines, thus these can be dropped.
> 
> Nit: Drivers have local copies ...
> 

Thanks

Best regards,
Krzysztof
