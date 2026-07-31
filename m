Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B438E36920F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501051; cv=none; b=KvUN3PuF/MnekXMUz3d9bNU/ck0ggBoFLu/dOu3erzK2RsQexjNONsPGpV6wT8BYvv5YBsGFFMs4IchCNwIu+lSMzW+Ex621Uhh/lo8NKEehInWnV+t6lX22KZlQHRjZ0/xceYoB+UFUsxtYUq9eq75HkwybN7WfCdt44IIBKoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501051; c=relaxed/simple;
	bh=97xMhas+Aaxdtbp0zsOusxbmVQO1qSf82M9iVTcauuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imrEQ9pzHDyyGwWxRCZXTv2TxsfPcW+xa6iMONjBcZ6NbO+xFY+bw8txn7JGDP7TXm/zKoC4DW8eBbqG1D1ZkR04hwH4n0oTXlT+Rdtp+B5mMEKVMByNEdI7HKqo9zXT35YjAezCsIR5X3AJKKmP7pDQ1E386+cYbcRO3fk2X/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkaIdTyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iW9lB6DY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkaIdTyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iW9lB6DY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCA3hr4154684
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V+iizjPwL2lzSdWcJwc4irkY
	vpx2hF3Kkz7sUCYL0/c=; b=PkaIdTyly+VN8aHANRg2u0s5QX8uidlUEWlVSLew
	JD1DQnfbrkFB8tZHD/ShXc3Jne3x4ZTn0Vz200Z4uByzI1vK4E2mKJC3BFgsdtOz
	pSVp+krXTR/m01CY+3Zd/Unl3bsy+4lnaCzlieVJCiJh6271GmaesMMIUXQBWrk5
	iuNp3VnD9XsClfGnXU8GxX9sPkbjTPbaibVbDLRHwFO9oiv8ptB1Kna8FEZT73T5
	RGfFAb083QprSpID9zAdamWz4Y2lReTZ5QDhI4kJwPmrdhOs1ZZ4VP0lPTM8xuHx
	Smwmqig+cfWexDF3X+Xwd5INuLfKFb746daHRVjUTUfL6Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkg263-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:30:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso8546211cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785501048; x=1786105848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+iizjPwL2lzSdWcJwc4irkYvpx2hF3Kkz7sUCYL0/c=;
        b=iW9lB6DYZD1wkfUEgj8c4rGvFgqA/MsMOKeDV1XHziUqC7DqczySBOqxGtDbbHT8c8
         9wP9PuCG2SB5Y3G4lBcRgwJ8aBSy4bnc2n7X++L3ZEAwXZV9r6wa1IStXH3/EFNtL2Op
         yNLLVK1TbjZssz2GlJSLPeA+CVlPIytFaU2o0U/UTE1smogViOAgQ+kJI6N7AldM1YCP
         6WHfrwu5iOtt78WaSgwuMipdNxIDahr9XhTujFJ5c0JYuSNEMnyuTtMCYJSWVqUIo/jI
         tBF1uJBD57W1IRXXv5UyyG4spNQHknVTrJ2EPcW4ZQpTiMozf64P0vI/1bedccWGZ7+5
         OV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501048; x=1786105848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+iizjPwL2lzSdWcJwc4irkYvpx2hF3Kkz7sUCYL0/c=;
        b=ChB2QaI/Jw0Ss/kpVEv8zfKm2ynJPAQ2jjoHNYsazo9rdQHkSpBzOExeJ1FlfPmRxm
         UxxlQEMKi39AvUaqf1n2hnxF+NC0D+ePtfYBJBmo9LshI6g9WgUZvrYSanuoHk0v6BOW
         kqtG8jVySeOkAOhCeFD1aYLB9RhT1AhcuN7z77XcC3Nk2Y4YxK+u0ywReP+p67wWZzth
         ASsYJ5m3JtwW5/oMYV/Iq0U+nY4ZY6PELf/zi+v7loCmSoRq3Yl8zpbHMzkK4FZBShfr
         RaaNzE1f6gwpJLyNHo6vm6ulv/BzaFrWuk5n5jlA7RnGkrEgoLNGE5r3TSyT491wUGp7
         TYdg==
X-Forwarded-Encrypted: i=1; AHgh+RrgD/1jbxgiNQBzFe1elh4EW/K5HL/9/n4gqADQvpvmvOT3VRvgWFlg/UPpyaugHbYdLOGwL8sNMMDVDx3z@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGAPVIzBDH5jwPS4r3WzSlNMHUAm75TcBTZgT4h+n/wr/ZyGL
	jW8QiR3nVw+VO7R670riCX2u16NKq6DiJYfz1FJEIs9D/+41zg4xG3/O6QF1Rb1D7MuWyWkW2Xt
	H/TlXxl2iPSXikNMlX54Db4zwIxqwATjls/QGXvwgy5kqEBJH7WTsOeBR2nvZh51sGpjW
X-Gm-Gg: AR+sD134Rub5srBVrlJJOwAI/1D4FymQMSUHxO1r/xDcHXCKcuyPFzTtGnVoVTlr/ai
	FAKno93GfWClLnxxQ7V3rEz8xE/9HSuNbDqkRXolA9ykdvz86Z09+F4M2YbxKuh3a7RE7OZgRUD
	szTFaYFEauJWFr4V90T96dvrrazmT3mqCfKpFry0e3Tj8TxYXtNXgzlBdIBQiVhbfsewVXTd2ea
	9sl3GS35j77Xo7aEsz6QThK2O8o2VwmWyl6QxbnnQ/bm0uyn8anWAt2nhCTkGcsDD2XSWuXnJ7h
	Nfv9qbtZrF4qHgC2EJNg2gPoNwnkcOtXw95JrYlYTiywZtQGTsh7tGqZFQ9XJXLuJluaCiN+53a
	nMXvPIXh9Q/oz3T6XgRzpsf36LEwKGTEb2RdZMwQTrpzLcqSGcpR8vGEZJsxxJw+yjY0KnhBdLK
	rBr0biF5s8O94HaQ==
X-Received: by 2002:ac8:58c4:0:b0:51c:22c5:daee with SMTP id d75a77b69052e-52b4af4ffddmr21970911cf.29.1785501047805;
        Fri, 31 Jul 2026 05:30:47 -0700 (PDT)
X-Received: by 2002:ac8:58c4:0:b0:51c:22c5:daee with SMTP id d75a77b69052e-52b4af4ffddmr21968491cf.29.1785501046341;
        Fri, 31 Jul 2026 05:30:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e244dac8sm279829e87.62.2026.07.31.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:30:44 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:30:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 00/19] media: iris: Add AR50LT core support and enable
 Agatti platform
Message-ID: <oc2iljh7tnrfx3u3k6jsuc5qgqjm6hyrnokaj7zx5hybr6325w@o2fx36s2urf6>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfX4WBhCDe4RTBL
 ISwe3NAsEMuzqQJN+7bA6a83hggJ8LeQol1ayPXHAzssDqsMHh4i7CEdwp18SdaFSSeaeHklahQ
 fAfgymuWECF7ymOoVh93HskbmdZf0K4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfXy7GoqQEJhutL
 W0h5uVgR54rf2Mwo6TyQqHpeGT+LXclGByRBvOfus/6+UpWRJXstyPQWw23Vk7mmNviJnQ9jnTN
 rymMCEDp5D5b6r+6nUogzve7uBky7XC2plUJEgxlNNvP7mXmJSrXzu4QR6li9Y0BsVUcL062T5i
 dN9/6NphPma0WYgNDn1uE+lKhVJY3ubiHCSnM4XAyN8PTkodB43QYlWPXm5MRlDiL8LjqEErWBF
 IOFVZkXLnDl3onuR7HWmivIkAu1pySQnZajqnOf0huGb2SYdK2WKTvmlg/TT3O53gLy9b6Vz/mQ
 XWna/HyCMGqxgrgQvXqkZ0musk/K9d0Up4KPskM042JAMJXlDCYrjBsdUBJA16XL0tfwRr2PUgC
 ks+I0bB5GAhXUdjGIDDlIDKEFLmFuv0AV2uIPYHGX55SB1RdYOfWBR1yXSndXNx5y4InpTV36Ty
 1CvI03njp//ZuU6sBxg==
X-Proofpoint-GUID: fq1F3uOH70qjA4lw2XfTQSBAJ_kZp_NY
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6c9579 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=vRvQBkcqBghEQXdP3PQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: fq1F3uOH70qjA4lw2XfTQSBAJ_kZp_NY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310095

On Fri, Jul 31, 2026 at 02:48:21AM +0300, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> ---
> Changes in v9:
> - Rebased on Bryan's tree, reverted the previous version of firmware
>   detection patch

Also added REQUEST_SYNC_FRAME for Gen2, forgot to mention here.

> - Added memzero of the firmware region (Sashiko)
> - Corrected max bitrate settings for H.264 (Sashiko)
> - Link to v8: https://patch.msgid.link/20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com
> 

-- 
With best wishes
Dmitry
