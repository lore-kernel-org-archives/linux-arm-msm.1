Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667891;
	b=blXdLHTrcuuZRBTN25ShNbM7L3B0YyuW0UynLIZvIcuNglec0BAwNkFajhc0W4ObiBlV
	 wCOqmgiCz88kR0L/MRQgxILR7bbe6YMiWyAuAxrte4wtMurzVp7Ot0LMkBVSabDPf4pkh
	 WNQwLltTaRiB933QYc42RcHax3QX3eSIxcICgCBiXnoanWnh+c6DTuDTXwrZQ5Pmtp2XV
	 Wdc58/yVNeYri9JEf15A4ggqrPOsWnDGwsxBiUFYoJ06s76pqL0XxPGB9IlSsCSyS1WBl
	 6k+3ssZaY74+GlhCgXvoytkck/Tvg6F22/hwSlwnxxcIQjQUGMo4cY6TDZKy5Lv858g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q9ZNYCxlssK4yR8eH0wNLKCFUZea4SJuw0eYLqnOMy8=;
	b=OzmbzmkSe/tKFRfX+NaHsAoP29aZSumZRrMan6vJO7myS8s5WRJkGi4us9gqVfEesNzd
	 IegU2F/ZoV/Z+XYUrWZfifC5qg3hMMZSnzcs1b7Oi95XexxztjWTbhJ2R761whFHAhrg1
	 nolmldGDoxEL40lMP7r3+sghtZVgnHPMPKc2O2l88sZmbDSRFnlkRyE6jyhiIpXCBV9cN
	 hM9Pa7SbU/armdqucG/dfavf4qDf5rq49zc0qVekBpo5JFD+H+ui3+Epfr90gdSOj8Sgz
	 wqmZwhzoY9nSuxtG2uW1Z+HaKvun6PfH9wJFBHacACdswjmn8ruXlTJaHADGxTsJF/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIPPTd2u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xqb+Tsxq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66286606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66286606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIPPTd2u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xqb+Tsxq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkhR12214277
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q9ZNYCxlssK4yR8eH0wNLKCF
	UZea4SJuw0eYLqnOMy8=; b=gIPPTd2uAPZpDL2kwsF3Hkp0tGPE8zpM2Uh9P1vt
	UPocFTdDIP5bZFfQvDxmMv66BnsrkMrxIhgBeVkPTaYyhgXkyWpikSS6dP2sT2ez
	5jzrGlpkqOmCniu+ywA6MBtkasXtcDEhSvF5PHED9hZzq2RV5CQeNXLVm3tZPSbn
	A34fOwM8RydN97g/WT03xRD8lyHDSVgKqXMy20v0ydaEUGtCSYuHl+WSzZJVEpiF
	65bec7k/07AKR+PbSvgdfQe2KBOcnEZm81sHIlfXouCtI0RgUDZI8eh3VGBFJ/ui
	KwIG4/KRqEH+2rf1BvhLaSP9Oldt+hruoTIVYfxtgu1j9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj410x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:51:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so380381285a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667890; x=1795272690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9ZNYCxlssK4yR8eH0wNLKCFUZea4SJuw0eYLqnOMy8=;
        b=Xqb+Tsxqj+cVOPDli5Yd4SN7aLQCbqKHkekW7jKosq5Pm2T082GSvVwrDjtz4o2OPi
         BdphgqITJteyhukQQeMVX+fqJ9sUQmbwk0wbLPr39hjgRGC0T7edT25bs4TXHNoM6bCX
         46Bp5wfBrJ/4/Zx51OOIIvz5A66y8K2i7E31bjaJKy21up8FvJhcu0uRdGuX422xVLWN
         +Pbjur8UVxdhdF7n/fg20g2ZDjYUkCoMeZXjtrhGl4VpNn5vPXdmf/pJd0H6nvC8GM2K
         Oe8GcSYgI9BL36sqJOGcOnMttQetXFwSCjLm5IUG8olTX8KE1nzTviw7JtCLprH0PbwO
         12tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667890; x=1795272690;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9ZNYCxlssK4yR8eH0wNLKCFUZea4SJuw0eYLqnOMy8=;
        b=XOCVFGCvu+8ndb44s8QW7zGHTNPyw5ACzCneDFSbOGDKw9GxrcPmgSrH4sxLH79eTY
         BZr6oeo7dyB6fHb355cp8QSV1vv1WhuMFIRgguh2z5yjBU+Twfp9KyRrMF731b7c3kJ8
         C1WcJrM9Ckj8bOLmz0Vthj+fEYz+h0AoS/GvS3htkiS8w+TBNB+wk6/IjIzkak5E7s7k
         0GnhupN1f7P+phg6PDXYqJejf0qLAgd6vCldRHddkKKn0FoQ+qpSELLPwXAyk7DYqXl9
         TNx3NG3GUSuI1+pZnBuYxPbiKbdcdfa22Orx2zsZkbraNfniqW/DgqH8XFtrVVBDwB+v
         TyCQ==
X-Forwarded-Encrypted: i=1; AL+hErGSY67PsaCuvMl6mIJ5q+T+gUzLV0ZF4aFnt5wvrK+rl0moaM26YUTKj+gs1BCkJhz7PYlKeoAfcocLzamN@vger.kernel.org
X-Gm-Message-State: APuU4Z8u74CTg21oOuARDF3Nkb1ekLlVqlbZYn+jJzpwHJWy35CaYJo4
	518FKlCVjF+ROXqIzQ+bJ5bB1CbwruPOhfoSOpIqywh4jahvxLVzSbCfKh+PdS3jAYpGarq2lIo
	rvbHDZBNCd1KQMvgOMh2oOkwR7ekkd/KMhyN5WE8ZvBVzdnPq5pDX9hid984UvbRBW8p9
X-Gm-Gg: AYBFou2zF3UG5P3LOmXFqDqxoRWk5uuUE0b7KRWFs9fEy0n79qwOwgB9SG3aE/oRz49
	0a0v5gBWwv/uDlYoBSrIsv945XMzvfQ3+eZKGA1FSFJkYX2kah7KV1S8NHrq3gMy4h6JuUuaWzr
	AGCrn8qOXLs+TahIw27zwIGQMzEa4RJxR3eiP9UZ7PNhb8Sz/5iJh9H7X70wbXH81jcbvPQ39sr
	IEnts7+paev1pIp3p/oH8m3zRbTF0dFim9M4SLQ6kGUxWqgzqTloZ8d+e6wop7kO3ZChcMPJPg/
	3YtUK9r+x5cXgcNIP0LJBx+OGnsGDtU9xrErByj/V90CdzPOzcpiU9AI5AfigejJvD5MMZwtaK8
	ZiFdq9H3GZ5tWjaNrRLd31nkA5ETJIrhsolfM9rBRCDkKxyALAx3JR6/FBZcCn+Zl
X-Received: by 2002:a05:620a:801c:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-9494bc7f596mr915054185a.66.1794667889601;
        Sat, 14 Nov 2026 06:51:29 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-9494bc7f596mr915050685a.66.1794667888920;
        Sat, 14 Nov 2026 06:51:28 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm11678492f8f.8.2026.11.14.06.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:51:28 -0800 (PST)
Date: Sat, 14 Nov 2026 16:51:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Correct white-space style
Message-ID: <hssvanq6jmddyd2zwp6s56dvj5chk47oiirlmougvhmc44qgkx@jsqitc6ybjal>
References: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX46DB8n1eZj5A
 FZ87uLFdw9RWb+xwA8PoLV9dQbBeKnPLTPybnoAi6jjyIiPPbO/4Xc41LGFpLqpaz7QaQuR2L3e
 nLHYL5IaSiHMWY6T0sFW6/4MXTN1Oxrn1TVgA3hWjPEUh7B/tlUj5rmtW1fLGjJQLQdMzNSsNaR
 GtL3QjhFb1YFBnIC6wiZyHtOe0JoBNUN9qdG9rmiXS+PRvmvgPQ3lxArolKQF35RZ+e/6JKM/6Y
 eBv2VillHYktbDR9eYn9nIJap1OW4YeQTr1ebARY/gm1HCw7m025j/dYJSHSNpenP2zWspapwNZ
 6ZnxbTiQYaPfD9H/nwsCGcxeB/67cTJvEN51l0b1+gLU4H2DPozDN9P3WYIDBbM/dCLqQfzV9/X
 6o2nEdXH/ZusKSqF52ejKT8mV6JaNuhtj7V39nIt3W271N2Tj1viAEPhP2x8S7tlP8FsSLO38ob
 P/HWZfvO4+XO+fsozkw==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af87572 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YbccLBt-SqBNLZOCNAYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5z-baLu9nBp3iqkmB1z-tLbOwE3-2WGw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX4rPkprxk0IYm
 1u8hUoUS08x2eBFhfH7SLSQsvHnyfS59MsCDLM/cRzb+ZjMMOBNRRQILdj3SYV6+HU3YYJrhiAA
 RrEYnH/d1epAH+0hw7z4zoBzKLXCBgI=
X-Proofpoint-ORIG-GUID: 5z-baLu9nBp3iqkmB1z-tLbOwE3-2WGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 19:54:27, Krzysztof Kozlowski wrote:
> Correct minor style issues around white-spaces (e.g. double space before
> '=', missing space before bracket, spaces used for indentation) to fix
> dt-style-check warnings like:
> 
>   monaco-ac-evk.dts:825: [redundant-whitespace] extra whitespace after :
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
