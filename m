Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712844;
	b=1v6w3azmxpDayycxK7QNcKql8EPUegki3OXlLy//6b7C+SfrXGPIDnwoak11fxVwWnC5
	 KDwSDZzankK3ktOi+wOWprHrlLW20pPnCuUicU/PTNb8hhLmm4oUQWmuVAwyxDJkMOvpM
	 vRycMKd8/dIo7yiP7WageJ0TCA8RQNUFqnkMJLWdUcSAnbYnHv4uOY/mstcCW0GD1nfSS
	 gv96Eq/b/LQdSMq2zVLmymAKWB+efMT2yb9Al6+49VdYX3B6RJuP/SQiXUAseH7GcdyyI
	 P6BWCPiz15/QV7DeDV5PDLXRy0dhCstyUJC1yAtrlCqxnxnrdsIFUwVcNdvPmUfkXbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DGNnS1KDT9U2hlA7Y5N5vTjHwcDSHZRJ9lAcF86hn2c=;
	b=v68iBYjICun3+Z1lGUzTurslFy306fnjxGejUOgwVeRWlBykyhwIjmSCObgNcYWBzHEW
	 gjFjPqk3uFlqrDq3HmEXQd8ktGriFTrUSgmmRMMSjJAoOdqBKcKFveo2LjcjRp+IfdrjB
	 ZtItTZDgSodcXzfzLdsnZVaBTlZmY8n5re2Lfy7p6qrw+xip15vG3n8+JAObQJ3NTuGhG
	 KDEj2e2+2ggP903eALtcwUvuZYzGgufiZGavCtbr5qvIEHbZ/iZWdvwBxUr4EXcEigKm6
	 wW1D6elpa71Z9N/vsI6mLVndfYXpTqnLo2z2qhRiHqoRjkGZAcssCJm691jXZs9CJdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTaeY8pY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVn8JOoJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A67D606A333
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A67D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTaeY8pY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVn8JOoJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Cl5eV2865747
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DGNnS1KDT9U2hlA7Y5N5vTjH
	wcDSHZRJ9lAcF86hn2c=; b=aTaeY8pYqKW/lDJlu+aXk12OEIFdcLcZTjKBbe+S
	zbVJcD3buxpIo5ueC0SWQ/hEgPGdgyRdQQKClIEJHpexHzlqm0cafh+JPhtOlwX+
	XB/N6dxacegZLiM0/nRMuqz7fz4XGSgRRDb2wm4L+Ytoj+GQX9ueqjELqIQA/A5N
	nPKx+uByj69LfjgOQyMu3EslPLErMjMtbQXZJwYsy8e+dPPi3Lg/Z/Rel4u3sb9r
	QL0LFL08NZGdu+JRQwlq7y8Q0bsRpipU3hdePcpGDKUIRuLKeRChmnTuRLVUJUsi
	vrM0+CkyXpo0zvBg0ZChmnlU1wuLn1sdHYPS/sP2ut3BHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jvd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:34:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so687031085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712842; x=1794317642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGNnS1KDT9U2hlA7Y5N5vTjHwcDSHZRJ9lAcF86hn2c=;
        b=bVn8JOoJX/cV8ZZOqeZ1WalPtHRVAWJV7lL7ophMCten8uLliFI0J+DvWtJnrxk601
         GEbFQ+AQa61IJnR/H5r7l9cpyvjRqXFq9W/ul7o73U1pnKamNoG6xZEGwk1BFNTZJILv
         suSZ2RdyDCKspvgSQ2uHQNU7vn+dKRXPsMVrtvtqoUEQhQyPLfBWMvR+eb+LUFIByrNY
         1gyLa+qQ7BpWEDYil6OWy9QlREX1uZnrZ3l69KNN6So8+jpHWYj+Rhww+0w4YUgcfpCv
         ocYM+L7/T/YLZF92rd6hnCON0+w2uhGmyXyuTJXAJrk48SCCN6NbX4VjZn5gGHIHAS0T
         Q+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712842; x=1794317642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGNnS1KDT9U2hlA7Y5N5vTjHwcDSHZRJ9lAcF86hn2c=;
        b=zS5QiljvHrwqfw7q8rJYERpHfsXkVKnWzmc5YdqtDeGlfjg++kGraI7kjcZbfmaK4G
         Om2dJqgr96EIvQBqjXtuSe7c6YWvZ9OuBmwfUSTn0x642tnNteCJP9vWFTOMH/SzZE+p
         TxpfqIt33V/t0kaPHKo9KttrzYR0W/29OpIUXqoR3xRdU0AO4RbtwLLP5J3sH03nALjL
         CDs3lRJnB38fkcE/u/3lPaGipHMOWxyRT/YoqwQxNRLYdt8UW624VU3ji4Hm33ECYLad
         pjMTxSLWjfGCnbGXUr8d37WGT099Jv3gCrMOjHrX1wyWn/PS9w6krFwQxELNv/5TYicV
         G1nw==
X-Forwarded-Encrypted: i=1; AKwUvBx1NQUFw5+9XeysLLpaB/fhc/gbCmpXQG0T1Z0c0TeWEWyAGedF80ggpZUFdRX4LBlQvm7K9tcisZG4XBxl@vger.kernel.org
X-Gm-Message-State: APuU4Z+3HF0U1n2IM3KQA1AJ3A2ec4ZPxxGF0L/4DvSlnVobRc+2wIBf
	671ZDPSbzAQI/ZJ9fP4VQZJOsBHLgYtyeRPPM6ZI2+jfqx1iXGku8kkCJKVQvU5+j6wyW4n3O60
	TGLEvVM6OpVYsZAuQ/UYp0Bo3TCWthQ+aCntAqb32PDFXwX2q0DRMIX3hFIcHd/H7Wb6p
X-Gm-Gg: AYBFou2OtuSr+p6tsNmVWDBFp7u7cly9BAAgi9aPp/K9k6bxK67ya7Fm4fagof1hqks
	eXCOIujC1yShoiRFeq1Iih63FM2Un7kfVRvXE2KClT5N3uyJ6OUFgI5NRAgUnTKf/aUs2H7eqMx
	yKeYfqgxkYcQDB7WiZ2hWe8yDyTYJ1sohnNK3WSxnnfHfiFnhP3BQIoTYqqdEi+dpsjaNBSMIXw
	X87993/bHkkOZr71CAfW43ysfj/k2Zn5YEBPFB/OG0OXDpi4sT+XbEOTCY0sns/IEgoFQT2UTpZ
	OHUKshPI3tHUAZuY/xTDAfz3TkpQu+q+QfT5Z/iVOjKc1Gxu0yjGiHbFhC2x4scESWzI79yj5eX
	0t3U+Xn2YznaJejS3EbKX1w9hMELzCXXm1g+DjFgBnmsDDQwnJKWbZ0LwzHoyaoQ=
X-Received: by 2002:a05:620a:400c:b0:944:16e7:15c1 with SMTP id af79cd13be357-94421659b79mr2181062085a.19.1793712842244;
        Tue, 03 Nov 2026 05:34:02 -0800 (PST)
X-Received: by 2002:a05:620a:400c:b0:944:16e7:15c1 with SMTP id af79cd13be357-94421659b79mr2181054085a.19.1793712841552;
        Tue, 03 Nov 2026 05:34:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm54953005e9.5.2026.11.03.05.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:00 -0800 (PST)
Date: Tue, 3 Nov 2026 15:33:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add RPMh sleep stats
Message-ID: <emrjperfywy2xcuxpu6ywan2qvk2jyxf7iy7hpgb6gm3vaqj3i@masqj5hu6ywf>
References: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
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
In-Reply-To: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: giNJWlp7c2sH94aypD1mpQW6zwnMX-NF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXwjvAJz9GkCjO
 xsAugq9hVMuFc4SI0UimZJgUPmJdVjGNnn/MzqxYBkF6/yGjkuQ+cTK5nRb+pZLHw7X48YjOKQy
 JI9SEV+2nUR3FBlUxyR1gU1ipolCn3xcG+Ag0M6JsuxhUnN2veMizg7+dqmSGHlnmYM5i7Byqkn
 Ur3FvK454VXgTXir/Oba5IMRFVEtpsfwK+fN4GhgclrJSOCphF5/SoD+xdrWbSSiMTjzahKMMdc
 5KULMB+ehYaySH8wG5DhFolkBZ0JHYWu1lfJxq15dmFhHmt5wXkXwxQgop/TzglDTEPTvyU61lk
 tSFAIw9bMTkr2eIJKaypiHjhmLBSrx7y7C9vGJLLO4/6VkfhyYHBXR9e3VcrnkVo4ysCt6hyiZU
 MkdymKens/QWiTzQI0K7/b/eLtSXi4bISvsi9xhDCxm37C0Z2lAVAqcavuZxfXM9eiQdUF1YyvO
 vflZ5m7oEneDROvbPHQ==
X-Proofpoint-GUID: giNJWlp7c2sH94aypD1mpQW6zwnMX-NF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXwLE49nF2D3/M
 R4CHdnIrRjZutkOv4dZRCZ++50mQMD8/18l1WVXAN9ABsNPe6tlBHzqmpQ1foE1rJWIrWIj1HWl
 Cbuu3KkwnExIfUPhxg/rPDIaqWIOD1c=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9e2cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tvCzrSW5HJhQ_1vAfrIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

On 26-11-03 18:21:44, Navya Malempati wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
