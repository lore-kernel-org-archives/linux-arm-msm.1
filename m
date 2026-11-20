Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170294;
	b=YqW9ZC9xl0T/easM9pJ0t/RH3Zvye0J83MA3WkwevapEQrAoJiDE0sfgE4bOa02hPtua
	 S5O8Ni28f0YIL1VYuH9JiyBtura05GT5D6813Q5HGjvqi53hQFBo2dGu7Xj3I40rv6lQM
	 5YakO6DRfnpJ+iDwHOSAxY9i6CGb2YMY07eBzaKlAgvQY1KgjWIeNxQQ9UBsHWK89jRHG
	 uDOtNeLPzKhX/8o+uzb7WR+17RUEfJ/WcUDDeU27yFUwrUQLM1VZuJPKYsMvYt12w5o7V
	 5vwDLa6yWUUng58c/qmFEj/XpYpK+Xqqlw0gljpT1Z68I+l96iMY1gdZd+OZIscyMPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
	b=hK+h+TA7NbkbT8BwLxL47wXu7F0HlBZNwcAXinF8YY39IvkI+uYXHbRY/1/JVQLkHK4O
	 2zyUGCbeippZGyeRdpZMJJq10RG1amIEB60xYK/khLb4y0plGTC3tUbPlupD0SZDirLzK
	 gYkcGys6VWNPsdxUXviHCpRFfd8SqvcbSj3PFHi2K94en4IX24QjCpZRzxH36e3Dq2/Dr
	 BBzGM36GZLxnvhLCZPCPbeAe8e4JhpBgQqOVYfWufp1sdCi/2lV4YMGhF2aO2Itz/nPq0
	 hyrPOsxh7k0OoDQKRBiCaALz/Zr9CZZHaBKJdH568inVYsPVJ1XvdwSWGKAStfAwCZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZGJSzlK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvlrrT+t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0103606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0103606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZGJSzlK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvlrrT+t
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f00b1742004
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nzLBBCOxZ1CGRp+RMhrY4PNI
	yoFdbWP3uo3fOhLpR+M=; b=SZGJSzlKkGJfixKeNEsPTNljyBzvJyaS/5hdSHB1
	9rM8ZtPGEkkj8in3rfofoAdHvBmy8O/+607Gbc1oVWBDKXuQcu1aHQut77IsvCyO
	OXtg0eiJFci7SDAP+SiqwYsDmRq3c5AZwa5rXmZDcFQA4SWMnXK6WD+HHWBgfF9p
	2P9UX1NCgJ1oj9Pa17Skn0rGtocFp6jpBDduNPmsbmVzld7ERlR0sscD1UwpXkTz
	aak3cfVzsIKdNYkWDcfN9jRvzLZl7u8ZcCs4veNBs6yW415KblBsbtK67hEf2Y/A
	W67b6VS89lHcr5JFAhTHp59U1mpRFP19clbxirUnNzXSVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhdrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:24:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94967c6d4f4so84682685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170292; x=1795775092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
        b=YvlrrT+tqMldMGT6Q5jM7N6X0ZbDeEq7oihb24FRMFkYw61On/GcXeLXl+ZCVn8nzU
         /CM6reVFGVhwyf62GfRc6Zgz/D9b9fOvmBkjhmRiB2EY9nEfFtrXxvmGqwoXG5kdv8R6
         vg9nur+K0Z6H7DOCjnS/c4k64M+/rwcmdB31W5/SJSNft/PDlpypgaZ3txb3Hn7aShcG
         IXCPWRZtm8IQqWHa71cJLMyTj2JbsCSxj1klrDBVCn7hLLyGqiWyjwD/VK5E/R/wlYMp
         /dbkoEokIZkHc8H4FdSVAdcTCDPRbef60m61K3CpUBZGAv1rDqFaaGm2nGAsI+XRC/y2
         BE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170292; x=1795775092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
        b=ll+TQxvOES1xmZokfBxe+bnw9fz2sxJBN0ko9jYBa/aCU+sREgQAWn5oSAfglpTGY6
         WZRl6MbX1/zdTF0oZCeJta1VrpITUCA03Blgg2RqLCkJQrEcANyruHYZSRysn6fYGuI4
         9F/GYi8CFzVYzTV6TkJoBgXwDT9w0lVP6GsdBaDM52ThPkaKc+RXgFOhG8eKXnwVJFUh
         Qi8NXd2H1W2tnZh32l4hLifsAyzpm0faN5pO3gZh1ot8eR5yp/Y/Fht7KTU0QbMIRAn3
         kJlM6bfhTlWNOK5xj/R1K7oS1Z++3Y7NTc7a3Jtyhe/wIrCBX1EdsZQtCCZBHAWTshn8
         Pbnw==
X-Forwarded-Encrypted: i=1; AL+hErH+ufz7Qo3G25kLMO1ojVl+3Dc31n2xS0BI/VBeddDIyoBMuM7dQ2WWggzV/0KZTv2eLp2oEWqaOjxGRHD0@vger.kernel.org
X-Gm-Message-State: APuU4Z90X0NIlR3oxNi2UAqJhS+tBBDjiP2uuM/Mm0/jg8YQG6ZNamvg
	azzzcoG3xLe5eYcgtN6WCIKA6ViImvjOyL2nm36sGkT5lOmGwsQWXKexPqQ3B8aWpqtoxwRcYW/
	t+kZFOAKSMrcSh4F7TIL1PBY+LIz+9W3VKqx7Gf01ox0fZ52sWRVwJESFLEy1cXN58EqR
X-Gm-Gg: AYBFou08d9rWNrV45zReotVRdw2JnFV3ti45J98zePNjRH8cn13nBXSmDWHYPNoGsI+
	pUduAREaQYvkfsRVXTD2fvE9eQUOZE20NoNfTx2G8LggvhHuZOvoM6ckRCUxzj5s9uBENXPEUj7
	WZRoTsoTBGfwlKmfyntzpKIZRzR+F8bD8c+f76jEUdIbp6RpdJgSy0/wql3o5YFG3nJltZ1pXX0
	rk3P3lGiQmwSdbJ+5Mof2i9cMU+LT8efUQK/nV/gv4wnzsc5W60eqzqP2ZQlQiANpiBJVhijL0J
	iWZNvCr3MFD3BPW4BjeHbsnitvufOFq6lUJNChKKBJ1RvqpUBDvvltcSRJENgKlaLcC/fkXhTkT
	SI3cQ86goo3MNG+15CsODqcR+owEBm2MuVZYISanPXULrk8omVTC5Z+j6qakNNtF7
X-Received: by 2002:a05:620a:458d:b0:949:7069:3faa with SMTP id af79cd13be357-949ba8246c8mr462892685a.4.1795170291764;
        Fri, 20 Nov 2026 02:24:51 -0800 (PST)
X-Received: by 2002:a05:620a:458d:b0:949:7069:3faa with SMTP id af79cd13be357-949ba8246c8mr462888785a.4.1795170291117;
        Fri, 20 Nov 2026 02:24:51 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5f081sm84205905e9.4.2026.11.20.02.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:24:50 -0800 (PST)
Date: Fri, 20 Nov 2026 12:24:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: venkat.yadlapati@yahoo.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gpucc-kaanapali: Add support for Molokai
Message-ID: <ru6sqipsa7uv2schc3eejuasbk5pqfhpcac5eyq6wjbea6ryy5@7lu3miauiivo>
References: <20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com>
 <20261116-molokai-gpucc-v1-2-07cb3bf37c78@yahoo.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-molokai-gpucc-v1-2-07cb3bf37c78@yahoo.com>
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b001ff4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=CjxXgO3LAAAA:8 a=EUspDBNiAAAA:8 a=8lLAj3oif3jFirTb06IA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX9iWxlNb9si/j
 exBuNIijahhd4FR+Bg1f/8zsuTGWVU+jvyNotclmKuL2hRufF41SuAol5/oOyJY65cpfRDR9fvR
 yr7fOv0ypHaZvoEKDD0DuRaIFsUqtM4FBCe3B/RkC4XfqzCMLkvJawz4QcK61PNRxBGV63G91qy
 biqMnqM39tIlq/IY5Hi4N7quxVMP9BbFMZceyWnQcS7GLYZLhEAFj8nsb8IzMoAl8bdtsmzzGtW
 eimdE+9FwASNZRJvB0ZCF1GucHahXJceRBscrQhYgVfnf5x2/AOghTgVJXwwDXeD6eVZLVfVHOj
 LsMbxIV2NuzspIsD2SOfF8Jr90WMcm+AhgsaIZ05I9fxpuduRhuuav5KL8JSsKoIqOlxWgiYYAe
 Fmu+w7Him7QiwS+tIrGUKQFmg4+5uUxz3u1rDqf2CIs3KZwNBx/7o9F5qy3+Ra+oRxRHkDBnc6T
 0Y0Q4CemtjHvk1tk2PA==
X-Proofpoint-GUID: s-DD9r_t9TbiWxmGQHW8L0gD43HH8Mz2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX7sj4LrPNM027
 vcKuehyZGBIN3ZyFCTu72f60P2CKtVTjqtmKWZN6vCklEfQhi3vkoEAcRrXHlmAtkeQedZc23pX
 KUGyyCcDKFyIxjKeLms34/V50XPtfNE=
X-Proofpoint-ORIG-GUID: s-DD9r_t9TbiWxmGQHW8L0gD43HH8Mz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 01:49:28, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> The graphics clock controller of Molokai (SM8845) is the Kaanapali one,
> except for the PLL0 CONFIG_CTL_HI value and the CX accu shift, DPM and
> MEMNOC GFX branch clocks, which sit one register further. Handle it in
> the Kaanapali driver.
> 
> Assisted-by: LLM
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
