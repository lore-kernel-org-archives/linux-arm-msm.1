Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3703264FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721536; cv=none; b=sOCGdqMQ//QSC7gy58QFcJNXHj1bWUfPJcDfMs18s/p0h7AB6X4Xo64HTXNquE4jq2JQmYUSW1gTFuJKob4eNzTG2BCGksryMY7IdYueWD3WEj7TDscLe16jKH2yT3V6qD9Ax2ioxGyQseK2uj5vl4Gs7SZDtBjghIRdO2ZQ+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721536; c=relaxed/simple;
	bh=GzDiVyF55rQfHGvleiedGzoAFgokxL+F8Hz4VCr0x4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DT3Qp82Q3DPZkRCtOnI0Xy6wSEgcZgn7tAnbo7sCuM6lK4ek4ak7NSCcUY1ueqdGXUhZ7bArbo15YDmHic4B6UQOppmYNRnYuuOMsar9PfK0dAIEuMNKePZdWfER9mW/Lxo6zn59cpUqa9tZ+GlexLx0gz0tTJrCAkPYzyijzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coHziAD0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COAHMjc1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coHziAD0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COAHMjc1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HDGT030505
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RU22bNR4wia9YsIJJDrwCzqt
	sHX3L5zj1xVSrsZMk3Y=; b=coHziAD05Fuyt+Tst/G7RwOBKMX5KAgSwKohCnE5
	aLGtBvfO4nOz/O52aVjsAAQJ8Gdg9W6VN5kxNIhIR5rdhQkIkEy1/IxR3IwF3joG
	MF5qovh+UW8LzBcKWrMAPSMWCYiVjaMFyKKeWzswIbJyJIBkrH6CBn+xkHH0tK4D
	8j8FVHzw0vrX1WUrV2d4rMzYbNpXEXbwHYqfBeAd4CgcK4nmbfPP9TmviUbmplZ6
	wm2263QFwLSdLVhP/PFyQUkZJvi6aXtU6ewZ1P40A4NUgEF6LiaN0blHTvKco0uh
	efWn5piNgsuS4JAUTodAY31ZlMjpN2idSBNLg6j+HQlIAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ggcph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:18:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso10680821cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721533; x=1788326333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RU22bNR4wia9YsIJJDrwCzqtsHX3L5zj1xVSrsZMk3Y=;
        b=COAHMjc1ZNNuqv8pqhM++8bxkvG8YhIW7VGtXDpYf4e2Z6FtAF1OEowaHBImXS0Vb4
         dhFeyoP+11ayW5mmoDTfgUplMZ7Y/wEut4k6vQ6TicBbr+pzp0Q/P//lHDwQrJ3mtRk6
         y+WqMC1l9bOfuuQmpLxGN4xEuxfFwh0yxSxZZxdMl9GMh2ytDNY0bZV+muDUiiNn7sgz
         dU/qsEK6BZrzFcxq3hmRUoRyOi9Zct0darlHfcmCY63Ga6L9B8jBPng65RGx79WbERdV
         hU57ExPIgMtLti7LnGXMKDtTedOOUp42kCBUF6GtUWPnh0BDBQcOTP3Z2vxUvA0Uq5ne
         ygKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721533; x=1788326333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RU22bNR4wia9YsIJJDrwCzqtsHX3L5zj1xVSrsZMk3Y=;
        b=EQZjz+uZ38gmiB4+RSxcyAZbCCxivMz3L8b4TM997p2iC2bBtmA5CqF3iBGEa7LhOr
         DfJ/1HtDoWLnx/lHZ1h879McpWKc2qDJ5xq9WR04BOAFcqD7gIjivbkUvYQuwe3FEp9s
         D7YcKK8j6rxgIcJJ6E7v3J4TfHVrl272c7QNE1NY1bVq/PaEgfP46dpRl8Cg3+cqGaPI
         77LDJkALHsVx083DsMEHHekf5NPObe/Y4thCrcWn7s8k4w7e8pLcRYXU8weJ2a9uxst3
         c8+TUW3TA+bIwq+1Mw2S3VyXBsGj3SDjDr2nTCbdaIbnLyc0GXuQQgNr/LCsJtobgY3s
         2q2w==
X-Forwarded-Encrypted: i=1; AHgh+RofZU+XbUobhRSRQo3J1nVe7P7NC7m3f18nTTxqk5ZaOWwdwntzzqM/6n0fF0W03mzmvPFMVCxRbOevSWTK@vger.kernel.org
X-Gm-Message-State: AFuF++kW7wWq/69s+nLBpEhjU+cjLo7YKpPwRWadSNvUB+t0SAmWCWuX
	cUCAiKPoYXzISyhIgmq85vV+uQgnWsVE4wXyFotpbVvI92An0+Z/p3x/4BL92m4suT9TqCF/H6/
	d8CuTS4WL2qND0EFP0jiRDdLyCg6qdTyxzMgThHXRYx4R6ra+AP53e4SdpZw2ZEh+FtgX
X-Gm-Gg: AR+sD11wUzbe4UXCKDThMgsHX7XNch9ik6VFIbXz7zeWLTvmhOM8aUSI60hHuuIjQU5
	aa2AxTU6oJ48+DLNVOcXCkWjqM7Kfb/28OAM186xYcPviwUPPgmFfGaubNxTEZXi5ldKZxe9SCP
	8oue4xjzrZTi9OKfHC/XfWqMqqWdYA6efKwjrG2l5h+/ExgNWXj1BdmB+O7NAPKKd6Co4D8ptnd
	HhvxF2PAEj31DGLo/f3N1JzhVFQ9FJdFQvV5xPpHsfULe4cac9qfDQovt4cBuC5/QpXXitg/Esw
	PbOoZmf0cNufN+hzoKL5mpzAipgwPVQiTVk3XKvKqaJC2FEbDfhtjvFAiw+cYF+6VO+yp1lDkSz
	o/8/FzSSJaXOM
X-Received: by 2002:a05:622a:1113:b0:51c:a70:5ed with SMTP id d75a77b69052e-52e42361949mr38131381cf.30.1787721533022;
        Tue, 25 Aug 2026 22:18:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:51c:a70:5ed with SMTP id d75a77b69052e-52e42361949mr38131061cf.30.1787721532481;
        Tue, 25 Aug 2026 22:18:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b6412sm2557081a12.2.2026.08.25.22.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:18:51 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:18:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v10 1/5] arm64: dts: qcom: glymur: Add PCIe3 PHY and
 PCIe3a controller nodes
Message-ID: <armcwsntigw4grzbeejib2uaiacv2tj7wnbrgiskyrmw6yyfxu@usacdurl3pri>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
 <20260825-glymur_linkmode_0826-v10-1-56ab597d77e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-glymur_linkmode_0826-v10-1-56ab597d77e4@oss.qualcomm.com>
X-Proofpoint-GUID: 7qUB049xhW6jJWygkzDXIY9orw44tEf0
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8e773d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kF0Kh6n4e_L3U_yLb1EA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX4AWsxKiPTcD/
 YWYWyseIPicN9mDrgvdWCPN76THtgDuwP/ZOikYKcBmXkuDNHs8Bp7dJgGYAi+DNF3B1df63hh/
 2ISAX2qVhYntSpR6b8xaw3XngdMsVo0=
X-Proofpoint-ORIG-GUID: 7qUB049xhW6jJWygkzDXIY9orw44tEf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX2vkQlOt1qtXc
 OIOod4Sq83EqTZ9E34ANcZAHe2+Q21uiF4F8CjjAxXgzNZ+XalNhzKRXCgu+1jHQZ+j8Rh+n4YN
 p8WbozSI8fFHYjy/gkikWCh9hoDc9Z+uE280wTpzVzTGiODDvLwAKAL9g5iNadOQT6RSP+5JB34
 r/PdU/6K6thWeWsclBizhZTSGHPmfmf7y3vjxkz3lKX4RwzNeezvGLDnm5ZfHjr5MbZX6886dZj
 f0wZWxGdBBd56/2ZVk3r/JmrxE2swSxqH45Cv8+JKgmN/ri/vy2KQQtYwGe2nAPltLiNZY7nc9c
 3I4qi2gtHtbRu5W/zH0bEAmJbFV8XxWapL8kt94tYLO3lfN8DCF93qBg/mU1NXcZcTqZrEWfxXs
 srvWqGwTNopuhshzp/ZROnp3oK+/1wlqaBXXIontC8vcMaY2u25jQIb5bKlL6Bvg6pnaQ34bUUk
 jvi8H7g0qZ2YkpzJcPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260042

On 26-08-25 19:59:20, Qiang Yu wrote:
> Add the PCIe3 PHY and the PCIe3a controller nodes. PCIe3a and PCIe3b share
> a single Gen5x8 QMP PHY that can be configured either as one x8 link or as
> two independent x4 links (bifurcated).
> 
> The shared PHY is modelled as a single pcie3_phy provider; each controller
> selects its sub-PHY through &pcie3_phy (index 0 for PCIe3a, index 1 for
> PCIe3b). Update the GCC pipe clock parent array to reference the new PHY's
> clock outputs instead of the placeholders.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
