Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C263C109A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880195; cv=none; b=kTfHA/46zDKGIqnbMU3N9WRgz/5pZtRJZyWV08y7DoMPzIq3pf5FaP4sf1t8wMNlbkB93OsuUsDtHbYtiflMY3yQbyOD9/FUH6HwIjWTonZOvi6Oe+icKW1LhEkwBMxFpdb+k2XdbWPIUuk4FmttjNbFerp/XUSzORz/Bq5XpoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880195; c=relaxed/simple;
	bh=J91BfsumvDXFAUs707QVXicHQZ8nrbG+8+sMJoroL9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Scpg3et6shXnQUVZuk/e9/aSMgCX2Yzt/w7Zwf4UrJGJSxS/HgQj18y30/RqZsMLQrcy1km+tNTsSsqlpuyiuTck1t9PFUa0DMG4XgMYY8e4cFUlQx0AEIZwhGuZ0ZekKEfew5QOLWM8rIjBBnTzzRWfvAOefp7RYF0J+IQb2n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MA+uDjAR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHTBgKyF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MA+uDjAR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHTBgKyF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lHoW1976807
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6Ze6Zm6Q8SsurdP9VNHjS9PuB5+1VUQ2wzJR61gZbU=; b=MA+uDjAReaqsoj97
	BribVfVQvu+hKfXXT3fzH6NL771tb/DtbUpayqgjqxjNbUv+lvvst+pfreq4XQfB
	9i/oBg+GXpDXKjKWVhKV3jAOOw0LPb4Oy4GLa72bd5ZuLWWkZ/Ez3kYRYPkBfXoC
	qga9+r0858gvS5U6d4QmDb1I3RhV+tK8N7MknZy4aJ+KwQtHt/evVZDqrIabKrSU
	I9xtDisO249HL8FvW/Qq9PWboiEKtvxNcsBR/c0eUV1F881voElggTlm5nF73tAQ
	pLMfYjzj4oWiZGERH0FPlbzfJALgF1ZeqMPdkxhyDKV8HdB12DdggVd7Y2iWDEeT
	nAinEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmkfeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:03:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso751585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784880188; x=1785484988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6Ze6Zm6Q8SsurdP9VNHjS9PuB5+1VUQ2wzJR61gZbU=;
        b=NHTBgKyFXpgqqEf2uKd61+I/zJDS8szArC55c4hWZbc7ixudRVpzy3I/Qot9Ry05CD
         k9D/ddpOgI7SYRVl3lmRXr/PAx9BpfI4f4aB4JnbX9UI/Z6k1DJqDXnUVy55qd6404Xi
         03AGwO4Iszg47pc6m2Gnr3+Zohx7+37DPf034SrRri7+JS5CFgc5q654LBn3aZHytUHO
         BRzO7cNDFEy1ym2c7YXQN3lXrMQXhDzyIr14qViKn00uYBDb621Amfy9i8eYwF9O4bd+
         GEUdiReMDAWZl4YOmf7R3kqfGhtiVYh9Tcc9+8pPXYF+SzSd6AfdWyX53lEId5A/PujF
         QXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880188; x=1785484988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6Ze6Zm6Q8SsurdP9VNHjS9PuB5+1VUQ2wzJR61gZbU=;
        b=SUoSqWE+UdvhEVDAGH8XlG8QfSO/xzkJroFnYiUKN1MISTdoljHPr2IHE98P+5Xh4B
         tWUjpthqsIp6+WJx8BkOYEV2+qmbxqSL+9ylKFByLFg4RT307F71iyJQr4djVDSwZKy0
         BrKPuH73X0pdeo4O00AgDe1Feg7FLNqPWIavJJFYRHGjCWq9Vk6ggr1MtL+z5nnhueBP
         8fNz05zeM33XKOD5KZrHg53R4nGhgOGOfkJjp4XOzRLnWb2mnZ8xr5lar8FNKh98aCeF
         xfula3CAX19FEDHfaq/xmPsNKX3eHHPct3/aUVThnq64L0RSDbuPhj3kKAVEpNGSEdJt
         rTbg==
X-Forwarded-Encrypted: i=1; AHgh+Rrr8UyFVcqP/tA0VLFqJW4eKC3YwLc38AGZUf8NZCwBa6SaAeun7ydGQkWxoJ8kS7LnJ3fy9Rmzyw5Ze2iP@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbJUka4wXorACEmWrEHPIAn11+4oyHbSVM2+lmnzwN6We/nNl
	mY3jdnuGOzFpu1id2MZZwWGV6vgy0ydAJdzM2IJJnJzR3ZEkgDxemxo9FlhLTRhc0+W7MkNzWEI
	dH/WVGG7VcJN8fmgSXrv9zt84GQrb+qsPpTvx8DHTU0gQ6X5VQjBQkp+GoydcbY2+qjnp
X-Gm-Gg: AR+sD13f7+dyap+Sv1GFUTGuSeRdQIwN0DumKtRmNxs0a13ZD1Si4p4eUALoWTmQycc
	ol589pxlB4Oh+18zsJZ4oIZFKfRaAZRZzHjmas/1u9MI5nXu4P/lVdL3ic3lIwc5n9r5ZyG+oSE
	tXwGeXVvwNQGifOBdBLubNVi8T95Bq1aBDw+967/fsutwb8vbZqnPmisQu1/WLbzeSAsjNbV58O
	sTDXXmoNb+t7jmHC32Y3d95417Z2V1Dc+p3ZfUXG6/DUhxx/2V9WkZ4UzdAwKjp+1otLp3EjelI
	oVi+LD5lawuhWdqDFeF38vdmemlDJdDr+GIEQDi6qmunM8gM3E1k0qt66UL5uAXMGvGkdq7X/zR
	8UsOEowRc5yWT1iz0JEeVGo5B
X-Received: by 2002:a05:620a:4105:b0:930:afae:129f with SMTP id af79cd13be357-9315e342b01mr256656185a.8.1784880188286;
        Fri, 24 Jul 2026 01:03:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4105:b0:930:afae:129f with SMTP id af79cd13be357-9315e342b01mr256651585a.8.1784880187671;
        Fri, 24 Jul 2026 01:03:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af244asm317674466b.27.2026.07.24.01.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:03:06 -0700 (PDT)
Message-ID: <3a2e5d7c-8881-4b83-99d1-b8984178a089@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-4-90b878ae0d4e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-4-90b878ae0d4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a631c3c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tlOuMNSg9W14aln77gIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iMdBM_UFPd1vZ9CAbr11L1nG0IfMRwub
X-Proofpoint-GUID: iMdBM_UFPd1vZ9CAbr11L1nG0IfMRwub
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MiBTYWx0ZWRfX8mVoh1p3gAld
 px9qca3WVtIKy4JscVFnTPRHgQ5JBIJqz9FNaNhavaggcZtBKWr1u+muB+aploZCUcIht+4ot+j
 yWz5utZyZP+srujmC9l9hd5ZT/ckg7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MiBTYWx0ZWRfX12LTNk34LWYR
 hbL28p6bBan94DvjWuE1kbvzApN40us5gy7a5S23qq832u+6jgNuAafVAIuNNgvGJDwMmd4rKAa
 X0uXIY+M4eUqotV2MUY6gy/bbsS6p4MLohwqH0PpJTbaA1XbqYVoOrjfToGSSfFvxGXNEJXpuLh
 pVZ1oI8qISoWCGUWkbQa3a2Omv89bxlzRtwFRXId566XgjVK5gJukdWegDMPgrSJXsVWGoy9Jbi
 cFsWZtPYFjJXnItu+6lFmMc7u8PVCU+2qeHTS/eIo9Q2mb2QbxMdzHtjQ5XOvZ2Q49gjRiMeN6R
 5rqP7YpCwtfPhOAtdWk9PGEAujKqjb6a5QrbvgtSu+3/U58LzoVzSX4CoycqS3FNwIaUpPbZH8b
 YPEgPdcSwttTqYkrSz16c1Q+2f9lMx6kkkeZczs6/saQ54Hp0meaDZT8qHZvSbp7VtDqlTy78Tc
 PFzvq2E9O1uoFfMhvgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240072

On 7/23/26 5:45 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
