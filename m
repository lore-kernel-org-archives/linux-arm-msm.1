Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD835C695
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415124; cv=none; b=W+mVeiniPPqjOEil6WEoLrbTJ1OlZ94/T0Pt1WJNuBZMczkwfZI14bIXczYzfzUL+1WGMrbwKveNXel/LudCMVTVB1pHp6/pzCv3UblHhiJjP3/JtEdxnGVioM4fT6SYdYjg1JutyqulGv+MsfkvcEIqlyWojbuiWyHWeoy/0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415124; c=relaxed/simple;
	bh=SRU/RfpB+1fZ79mr+7JyftulpvMbC/mM4H+kH5o3agY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0YyT5tvY6LOfLtsGupHPfTEsB09AbAw4vcbAYRf+dWmYw1PCrnjuVAxql6rOT1zBibIzHatXgyTEm/fNT0bYd0gin2o7TpL4M4gnCnRA2lnN4TPPJ/mGE9RfRATMifih4FFJZuuJBvPeXcYB3QxJ6y3A8ZsdY3D2NK3V3dgpgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX1NWLjJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIG8nern; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX1NWLjJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIG8nern"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpu7m2252429
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZlAmx41l+Z0wevtJKQosZFy
	ZSbNZXhxswy5WZuDcYY=; b=RX1NWLjJqnX3HjpwVh2RPKKh7pOHj8Pz3FKkg8eb
	s8vncGVpuNIm+LJbzF6iEubxZNcg4G9XvQ86DNWHREIIZswybwxSuh7ju/m5ueXd
	Jdfa6LmI/SIbBy9aS35uD3BedyLEo/2yHYbHwlitt/g0tsWNhj9SARZ5v2aYaKkx
	Kj1ZIlXc2KExvqKkc67G14TkMZXwbJ6doV8lRSfv1nC4bPyH8N6RIEmUCqaOUqU3
	Cuc0nlqBAXEa9ZW39MAMy74Ni+beEHfQ7ZWc0SoILiJGN5xAGI2yKYqLEDLOaqhj
	zyVxTXSl9hHZ2+bNxlEmBhlzYI4HYX6yixZDodLYb7yk/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk7a0xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:25:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so259835185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 19:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786415120; x=1787019920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZlAmx41l+Z0wevtJKQosZFyZSbNZXhxswy5WZuDcYY=;
        b=SIG8nernmrUhn4w8hOfsqE2ba44yio+1maU3eknp0UaqopHMbChAo+xJpdExLOTP1w
         zlAud8TJ1ypspYe6dGs2vRrCp+CrO/ntbn5zyvT+P6Hd+FyjhE35aRoyV+JcFjaRafWD
         VC6W09HQOErJApEG+UaQnTrx+b0OaBauQoVN0h/AzTv6bBx/2Mza0rmS385RgowasqK1
         u+f3vq0Tkj1QZekhkb5aiIwHmWOCHehLIw9Rbw/4qbOsZ3Zf8/0PkCJRln+ZcEefhCYj
         kG6JhtHcgp7zFHGHLMkW+86cvSIaQM0i5rZs5uwrrQzLJB5wBcaQC3Fp+D94goQylU2n
         k89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415120; x=1787019920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZlAmx41l+Z0wevtJKQosZFyZSbNZXhxswy5WZuDcYY=;
        b=mEmbDZuxcCebmlKmVIac7QcNqVM4hFAlDruY7XUtmsU9Lwx3TDitmgzEkTCbGGrImG
         ojvHMZ9tDPNKVhwXBdC8wvJ3BELzBEuk01oVkjBxZXe6unsF8WNHQRPbLuoWktLqK8LL
         VsctOenqJfh4szAdxy3dRmI+J/1hdNgkSiTRpxmxmQUExNT7G0SV72QrE2OiYQzT4u4v
         8N6q8mdTSigk1lnv/WYWIzMeMZRKk+zARmiaZip+otI+2EKum3uXQTt58Ae3UZVMJkL3
         EdLEPnp6voNWOyEPyWlbD4BnrwF3J3F2B5eq1GUQ49LpUBNWTBHodb5ZJH1EvXuqScv1
         Y/6A==
X-Forwarded-Encrypted: i=1; AHgh+RptYArbL2Qz657B//emndUktrSVaLAwHKcSxiX1BL/zddF7FAWJGhTJuqJP5uYIio33C6OIahvgigJ5Iyzy@vger.kernel.org
X-Gm-Message-State: AOJu0Yza008PyIvaVKiLfM33JGsJVhnu7c+bu6wXfEG16jW6PNr3AK0X
	gdt5g5/uqOtw+e+Lq173QrGr+ZcZ8dq5JMdQbgJJqhhNIbaL+mvKL/xB7SgqiePexDldZe84ALe
	6MY4ow4pAu7UWOiNDqnzsoS30PvGy4Z8E/wX9RpuDfeCRT836jx070umbJjZ1K8am0j/l
X-Gm-Gg: AR+sD10lQJgaplIbkT9n+iTuQXMpw4WtbKXhNOWJYHM2kqkI9MtOuQ8cl82mUNUQ9Qk
	hkuXyIHOUukis+eOrw7M1kNZNa8MgvqYqLFNjEF+Jac5Vm/V8y8HN4dURzCw+CFh1Vg+XsnKwWG
	Mmf0fUkJNbVIb0ikvpCKQjy/Z1+8xUG5DACQGgoNX3yL+ijuSpWQCM00ktNk5GuAiTgPz7NqJ74
	pQNVv2MdY7XozLdQ8cCLW72Y+LYph/xqurfsLydoMBvFbY4WE1x0DAtY+lLjZRvzIQFiRQ4Wn16
	vG2Pz5QD1crcIsxFzGMkdrDM5h54jJ7e+bKagEM7XXISdBVrFLx8PcCeV/WTOvlj1GyXY84i84K
	H4Yd2NMBcwheplWCz1sJ/FLUX5yFezYwzVh/nyff3Jlf8w1M03ErJtBtfP+Z/kSKbjkjufv1zdb
	VIEJBKpSkI2QKJ3A==
X-Received: by 2002:a05:622a:17cd:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d58620b0cmr1248501cf.31.1786415120386;
        Mon, 10 Aug 2026 19:25:20 -0700 (PDT)
X-Received: by 2002:a05:622a:17cd:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d58620b0cmr1248211cf.31.1786415119968;
        Mon, 10 Aug 2026 19:25:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda80e00sm27145951fa.9.2026.08.10.19.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:25:17 -0700 (PDT)
Date: Tue, 11 Aug 2026 05:25:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: qcom: nwgcc-nord: Add video axi clock resets
 for Nord
Message-ID: <5xlwfx2n2tembxkynxeoyphvaxqnctwmg22x372y2rvgcvo3n7@ihmxokmircjg>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
 <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Yus/gYYX c=1 sm=1 tr=0 ts=6a7a8811 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-zE5Bsz_LXmV53O_SacA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HHr6sx3-eP68ObblpON6xAKkVnQ0Dlwr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAxNyBTYWx0ZWRfX4wSUzdsTRa/x
 KGbVpe68ypyMMccyeK07nHmDAYidYob7p9fTFLTbG48n5UKThq14828kG6UrGG91b3SolP41LrH
 myr2FlNob8WmyjGmzgCpYlA3kE09DmDqUWIzeb5mr0MovfARGNUn5u3HyHVcoRLGmQvCBEpRQf+
 Z9Lv+qHSteeukRBJm2brWlwXkHZVrzySiOuGnNDHUOvnv1sPIfnfq+VpS8/x4DQuNtGA3ArZlCG
 LIL1zh8+FCBO5SPoln6iglO9QQDAzfWxwu4tEkR4FITFoJcIOyBRUPsMsp2tg7a13OHAiCq1U+V
 T1RKzUIQa+igSyZk9K18+NO+azayy+lK/AoBwFZISZNUy6wz2D5qirLx+KBQmoRCpezWDE201Uy
 9uTsBPtCxPgc77xPmE+kL4I5itx6bdeTFBz3TP702ttl3O9gVLouhv+zO2sSKc2VSIZvvNA5+3F
 0KCKaTC0RxgsPaijPnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAxNyBTYWx0ZWRfXwC0nN28lnZyN
 IvS5HUm3feI5B9JziqqidiTDr1gxVqD808ShJkphXRr5fZKqNLdUfXB8gALL/kx4/kj/pT+6oQz
 f21CFnusUyMISanh9F9giAMssI4Fpyg=
X-Proofpoint-GUID: HHr6sx3-eP68ObblpON6xAKkVnQ0Dlwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110017

On Sat, Aug 01, 2026 at 07:43:53PM +0530, Taniya Das wrote:
> The global clock controller video axi reset clocks are required by
> the video SW driver to assert and deassert the clock resets during
> their power down sequence. Hence add these clock resets.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/nwgcc-nord.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
