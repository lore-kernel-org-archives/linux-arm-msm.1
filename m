Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3A4749DD
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531159; cv=none; b=nmWVzjKuq6kLwYqMPjDcufRBUfXmowkNIoA4wEFhark4iGwDGD+iCOX1+62oOR2QlmAvGC5Cy0ybQmqMw1zx06uNDxqsrNAg1OuirUHWRwLivfIkBZjsOQ9P/sqWS64pkCWPmVbQMyezrHHTWNsNBnkA0W7W2/v2XnRXyTwf/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531159; c=relaxed/simple;
	bh=uG2fvXOs8Q8N146YBhJ9OV5ZwJMu4rQIyRcslPNQR1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqXPPa8n1JGrd2BB7LIcQ2/B6oVUDIlsHr+xFOhM0SbNyFHcSeAcySksbR4ciHok2o4Zm7I0kEktT9Tn6NiY5aYiPVTzS87xBuxUPCBQU0+Hzy/8skPOqsfNVHJFUED1ofzMeMiRjHWOYdB6vg13l7SwyJ8Jv6WOP08N3wLpepM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNgIieMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wpth8HUx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNgIieMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wpth8HUx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993Hhmo452240
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 07:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6HnU0h/lQqsemsQrOUQLb2l3ikDGLSW9b4T05Vtskc=; b=bNgIieMR3fi4+lYi
	Zx5jKmnTvCcSO+VtGCiAvJeLaHv3Wesg5+QCK59mAi3P5jUdt5QZqqaypdKrdCcP
	FQzqIMsmc9qs/4x91JOCG+GxNn+pkIUh3EqZq7IZ6jGsFgUhhkiQDWGQz9dSnw9X
	a1nrnHBVaB6ZERt9g/Dixql6A2n9bbYxTJ/UrqFyD7DpL9ACzbuOlchbDsqKJ3Oe
	4avbPBaurH2bSxDrt+lcjIKi0kUvjKk6qAaQ64G2sPQfCb9J042iU2aAsE9UQ005
	nO5JP8U+AjOBJyPHR0Wd9W1GihBdJtA4SB61J1vXNoz5CgOYhk6TKRoGUvHAqV3V
	GN5yBg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kkmgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 07:32:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc435388657so6990010a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 00:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531156; x=1792135956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6HnU0h/lQqsemsQrOUQLb2l3ikDGLSW9b4T05Vtskc=;
        b=Wpth8HUx+9H6jxSoOOJ8+zzcHsUKDPyNElMu3+l8cuqCQ+fpuBI6dNsM5VOQ1zLKwY
         MsKm9fWjvvZUUf8X4j2dewrSsUwf6Edvhqhb22czagvYAxFmykoAueAT8NKzGkBw3yl2
         yhorK7BcaBVwQt034JWtJLhuOQ4SUnJu6RldoZ+1VeSFaBpmT+CCe/UrbwziMb1wS4zr
         +lnawecHE4rqwSQxEgcavzeFY5Q0NGaGBpKbE8mLL0czb2Mw+mlLaNfI+6x4zyJqUGir
         oDyFssSrIepEJfZdDFLLewPMCp5mVJLxdtU5WOGQShh34gPsR/sAVby0Ily2zOFEpCaF
         1Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531156; x=1792135956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6HnU0h/lQqsemsQrOUQLb2l3ikDGLSW9b4T05Vtskc=;
        b=Q21kR1NRZdo95E8q6Gh0UxDQC9Zy2Kudq59Nvt570Cgbgv6Rm+e+Td9SxLSKsLKGGB
         1r3IH8uRU+p8fL9PHRAXU1XrQoFq/ydi6OVGgVTLB8Dw1gmPg2peZzN4juN4d9ijdZcM
         JsNhsNX8Y4++TYEQZyAJJbDeUc1LstiIjZiJ5vj9JdsV7PQHeqn8GOHYYMYDN3BPndmq
         OjfiinPCNjlNb5ey4zmIrxOj2DZSWPi9tZzIoAlrYV22NjWhpxshcWxXoq5c7nG1YCi5
         5h8IF1zBVeZC29IQNdSEp1GmKVhmSDOo1AZaFg/mfP/90pZOnUdlHLZqDaIJujyTy3ZD
         HJqw==
X-Forwarded-Encrypted: i=1; AKwUvBy+u3Jn59elRgnBJmIBErToQYXofLdeyNeDmT0RId507XQruOysvtVdl7NoYzLOIFc+NNKjCz95tHqBFNZi@vger.kernel.org
X-Gm-Message-State: AFq9FYIz2ToIkUgRrDlAzpaheHaMtgVYs8Riy+I2fKjCvAcZ4biq6pL9
	fEffF2FNm4eoSuAGEASiJXH2XVHObMGA3LYl5xMkgeGnhRW+fqmSyxMpoCOqjFMlt/CqG23FZqo
	i+n+9j440xwPXIEiatAhkbF97DBJBm/2hFDzgTSwDomn9QRc8toE7rQRSr4xP4RjPdhtW
X-Gm-Gg: AYBFou1nqrwZ9lUA5kjZUNPKyo+cqfYFmz16V3v/t/Cdi2ZvM3xSsF+qbcvMDbioH3f
	IRv4pxx+cqcqL652jYsT5RNSZ72XEFMF6QAoYLhGTDqZHo5TJgEmPlMbOfekceR43Zj+87uj9OL
	2Whdpz8itlcg84OeFgIbxpA05KwSbIfJPidUB80jLxROf2Tz9JUX4JWf+CX5hOMYd6aNEBQeVEW
	F62TOumPGvBKKzlblo4GHg7oZApiam18ZWEYyytHVu5OCvQnh+0WI1JK8TDgyxm+Cv9XrglF5YU
	Q7xpNnFl6cMamht1tfEw1kTnOUnlWGGZmgssAeEQMekGqDA6QL6KYbdoRrK2cuseDSh93sla8zg
	MAiQcNIvthVZOrjljn5NEh4KHDb7ewjIE
X-Received: by 2002:a17:90b:268f:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ab3a778a55mr1089553a91.32.1791531156185;
        Fri, 09 Oct 2026 00:32:36 -0700 (PDT)
X-Received: by 2002:a17:90b:268f:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ab3a778a55mr1089530a91.32.1791531155710;
        Fri, 09 Oct 2026 00:32:35 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm1435629a91.0.2026.10.09.00.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 00:32:34 -0700 (PDT)
Message-ID: <778f15ef-5052-479a-9b45-bc3821b205ae@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 13:02:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] i2c: qcom-geni: Use common GENI resource
 initialization helper
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-8-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-8-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8WSIaHgN-HrCYWbtAsVPCAhRrDWFXBm-
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac89895 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hk0YJ0Y5ifG0NBj8Rn8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOSBTYWx0ZWRfXxrjdneXmckFw
 6Mo4tvT5n5tYZazTphrZRNllwFzqUZt7CHQ3OQtjWH2u7w9xHHRnyFOCKmtuxOtKR2EGGKS3zTX
 pO48DX9AtfeGfK0PCSg+ToPYrHxu1mo=
X-Proofpoint-GUID: 8WSIaHgN-HrCYWbtAsVPCAhRrDWFXBm-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOSBTYWx0ZWRfX6A+puOnaMNQW
 atDmQcr700fuv2xmwDsaTa0H6zCfz8zuLtaf8Mvfjez1IJTpE5TCPOWNmff/sw/xDn/LNelaxi3
 tR+Rjl7hZJ2w1z2pxQjxB1sTrn1WG5osVJ3A5pKIVvV6kVZNrNF6lcygRhMxL16ARAkedWGZBWp
 q10yMYsr60YHzxVzrZkwU/UY+oVDhpxG+bKEqpnds4V5OepJ8WSU09aKJO18dEBdFyttC2Jpt2u
 ltWemuJo8LMY2LH9qUNcTy+eDV7oo/KqRHN7scywes56Xh+YSw1Ucc2qlmFc3iJrN+En1DDZNQY
 ZY1dv8I0S4xQnisoCy7b0CiAhSXYWx0+nAAqEYvQ25vjlF+CCRKxeu9ewpbFKBYIxKFLOfS0ayG
 6gfoN0Qit6QIhh4fmiXpbwCUrvPLIG6DMsK/dDGxEiZSzih1wKougwVJtSH8dJEsEJuZRVaj5zM
 kZZV9uUxV/VlgnYm6PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090029



On 8/27/2026 11:29 PM, Praveen Talari wrote:
> The driver implements a custom resources_init() callback for clock
> frequency validation and bandwidth vote programming. Neither operation is
> required for resource initialization itself.
> 
> Move clock frequency validation to probe and program the ICC bandwidth vote
> from qcom_geni_i2c_conf(), where the bus frequency is configured. This
> allows the driver to use geni_se_resources_init() directly and removes the
> I2C-specific resource initialization wrapper.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
