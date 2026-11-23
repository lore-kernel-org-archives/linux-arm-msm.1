Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462774;
	b=5N8PPfFki8nVD801jPO6iOIoLFG6fH78g8gTnPcLQ8eaGmAydtH+ugdmOiHVtYGUwcly
	 5ChdgpgzYGTUzr1iIBr1wdmkn5fI6Bwl93aE0ll76gy5bagYuGt0J2teng1en91KM0vuj
	 PaR7bSyNQtCuMrnByTe8CRwKJfyE4kXe1/Kd2oN03HKpudBQaWTDMhbfiGMBCb4FOQBjD
	 zJSREDLl5DsUlxxKLvtFd/qT0Y3cYur/3AqkDyuc2PI1F/NZQ/1ZAq14NfUWg6qzfbkL5
	 4LkzhrnfHG1geVnb8eW/RG49fzz0VjpaAgVTZGGtySkj5dzGtewsi7afa9We91gBrlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=haNVO7gOhf5Ym+jj9U2IyzMeC+mkDIqkrVpNRPXkmrU=;
	b=z+pAW/z1jlPHQEdwZiiEOEoFX+Lkuv7bnQtEkAim2qPe4oFLG2rnGzTzmiY0Bpan24aK
	 tvMImgpY5oqFuQsMrvGe0Df1a3qKTB8WtH+0z0a4nzP6ib//qB1RW3XfWO/3IXWmO9Eu9
	 qlPcNYtddBPM0OxCDEk6+W9aMjVDVsE1Nsl7ztUudM1CxPbPLPTJD73EizIpbhWTvBpnP
	 C7NBRVVZVDIVyPT4qAqT+2eVhG8Lni3xl8tXSOGBtBK2BbUQWH0zx1AvBA6s63bit/kN8
	 wwmtl17vB9Z1n8JbQwazIzFRZn08Re2KlsgiOxlV5+4aF2C/vWlcJRefZ1u12CFFwBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=in87BECI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E6BCXqeh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54E606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F54E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=in87BECI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E6BCXqeh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1kXo3211889
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=haNVO7gOhf5Ym+jj9U2IyzMe
	C+mkDIqkrVpNRPXkmrU=; b=in87BECI0Pt/FGjGRSYHFDOIJgcNMkkMvbu0rUft
	DqhKb6u4B2ZYJRTDxBc9WD/Zvm0ZaeQ4iYKNhz2DzckJaq72V1QP8O9WFsvTx/Bh
	H9kbwok7Qk8WkJRlkini1eybC70UD5x3qLWr56ftt4+OfxvqrQjWWFKhLLewkIyY
	VC40bA9TDydeNbA+7/zn4SslVwPKq1E6oI2Mb6blc/SB5J6xfY3ecMLcKqyHzX4J
	PLxB7TcTxv2GyskIqpACXevEXNkZp8ZUCDwrEXqKJGfiWbBhlvV8JMqpne2xaHlD
	eSuSAs5vXrkJWTnp7Lzy1pPDv2kABXG6A79WJzgClOAyJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr544-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:39:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so738325885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462773; x=1796067573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=haNVO7gOhf5Ym+jj9U2IyzMeC+mkDIqkrVpNRPXkmrU=;
        b=E6BCXqehJ/ur1dPMWVrx8gdfpNjSHjplpiP8C19fK9OcVkeOAuM0dQ44GxUR+r1+Zv
         8oHKbBkOCZeUbUT7UBuc+EIP9lFxn9D4GRoITCptfEaxoutz2wemfjWN8KPMFYv42h98
         MbsmzdpuJTUp4NkfMHjOVY067OJEPcAhUSQgOEycJQ3W9TOT7uyMfDh6irnSMPD6HwmK
         /TAfHN0LChvnSv/cHSTntEdv3B4x7r21co9b2c+3Bt/1quzE3f4gMIUwGVZQ9jsvkpjn
         hHBZboWvw9+yIzZBown5M2oBZeZ/afMyBsBOKmN2WWNtQ1MAnKpgokaAwSN6DiFrHPVE
         MF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462773; x=1796067573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haNVO7gOhf5Ym+jj9U2IyzMeC+mkDIqkrVpNRPXkmrU=;
        b=k+CcQOjBWwKJdLBaMsqw3D77B2r0F1LlwfA/MExDtf64XUPYpaz+2X17ZtjapgOO0e
         u0wmi5WRE7q+73AFnJBHm9Q3NKwAcyvXZwNuOAxLnIzm+KTDhb9a8uowNsZc/eYSysmu
         7h2QmZtDY0xJn4I3quOPa0kxDKnjbr4lqVLoKoB1UHX8wxLSKH2/nW/u8tKI9s7/dVVr
         FzQtXvqPe4c2+toABkr2rk0TRBFFQHkGUGiD2Ver7N2wMLfAnFa3j4JZ/e7B2G6HsCKC
         AbdSVONwC5Bppm8Qug/lon3HtDAFPgWSY2fy+MzqKG2osM8ScaZ/Jkrvd2EwtU7DEhbg
         lAHQ==
X-Forwarded-Encrypted: i=1; AL+hErEImmhhnFnTLdQuqUUwDKsLdvwtttdEZ8QJG0/K8zgnorL8zhzMC2VLw4BzqB3/LVG1APU8jNxBSqSk0kYQ@vger.kernel.org
X-Gm-Message-State: APuU4Z++PERBTtD2d4B3xEyKoLsBZfHF8DW1oaS+12Xx5Goc6VsJ3hz4
	/e1rYw+ztNI0/P8A/GmxlFJU9YOGROd4RMbBaMMZC+cB/6TmQwrCXkmkrAk+xwpVGvDatioxFaE
	KyDbjv31RDDmRPOqX/SFVsSpIPV5qgfb7f9T3gv8djvweuppHTkcF9pqdMaJ+9lWi7gWb
X-Gm-Gg: AZFdTZelUfVSZd5DyCss1wM9YpUutCHAvJzlzeTTUaM9IZCiJw/NJ5C2y98Ii8mAl1e
	qmc/MG0WbH7wRGZjgJy9wv/WcMrYpdqFbrzPJgec6g/hFEKYeEwJORLkbitkiBQX9LrxWtUk8di
	fpkHZYQkfzkO5z9Jyhb6wQqsvbGMjOLdPjIJwjvNwYbLaq/x51xGVQ2kmzJcvBwtbSeazgngwUN
	VqQchoKohzfpjCfSPZJIWcWh9WQu2ogFkUABAgyxNWjtANc9AYJDZh8pZ9V1fLt0Nm5/z6+VJdI
	99OuA6uGcpqixJroF1hjpzci8Z2V/pB214Lnx/jGZ5ILkcpkPAJmSe7TSiY3YgGAF+NuMH95F68
	nTfOj1luYbrklI7bkPy5L+rZ9WGx631Gc3mfv4TMrsjogwg7YDJIC6pcJlXtyFFk7
X-Received: by 2002:a05:620a:4403:b0:949:7750:6bd1 with SMTP id af79cd13be357-949ba9c26cemr2181775385a.47.1795462772467;
        Mon, 23 Nov 2026 11:39:32 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:949:7750:6bd1 with SMTP id af79cd13be357-949ba9c26cemr2181767885a.47.1795462771705;
        Mon, 23 Nov 2026 11:39:31 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm550971745e9.13.2026.11.23.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:39:31 -0800 (PST)
Date: Mon, 23 Nov 2026 21:39:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <frzrzvk6blfodotve5lndlqj23qpefqzedq4qeafv6o6fsayad@7o4bskhjiun4>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3qkLW8MbyeKO
 tcmf1qxPTjh7gtFHoYZwoJiju/O5mUYULstD6wgmt7AfFCfAg/qPbfJpxke4Ke3gOGyO35OxH/7
 YHOEx0aN3tp+HueIOjVrKXqghc9TUQMA1CQPE0viTzeJcGc6Pgr9FmEcBNbTsocoj8+urVlpjqc
 DxZstLN3BUP3UOUVBocHjrUWOEd3fVatXwBoNEQ45aTLwBHC4wO2DXZJmkGep5ikU/YNmYrVp/8
 awd01gZqEwl7BubLKwO82NBPFwKa8TcvPYn3Q2EO2i7NyvLP7WwimvJVQGIz5+b3tPIuWgvZVZI
 Bm8S1NSUwVVcOisMafKLIJdc5XyeEiR9oobiOFwCa6oAKKqDNTsyJquFAxAC9wjSth1oG9yX2Dn
 KqGOKch07UMxlGwkmWrNiTnKhYxge58UnszlaBAa6x0i6SJC6AVgTD8gAnEn3z8TYzQDH3Hd1q9
 ZVVi9Ve9j67Rgd+lBqQ==
X-Proofpoint-GUID: V6ssUlQsY3ll217uKVcLFRv9b_cqaoYA
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049675 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PLo3hsA5cR1DE-V2qI0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: V6ssUlQsY3ll217uKVcLFRv9b_cqaoYA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX8QywAelNinI6
 VOkTLrwK3s2VgzRm7SdggtDgxFkLHZ5IsyU8JQSDp5KtgIuQpIQhQvZ0/qSFvdSbWpejbDkH3D0
 RFMCC1WsIptOEtxtzOayQAZayMa4OIA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:37, Bibek Kumar Patro wrote:
> On Talos platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
