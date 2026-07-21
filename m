Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BF043C05F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672942; cv=none; b=YJ4IIujVh30CJ7++FeDfzKC/+6xdwd4jVmjmdWmuM0X+VamdKkC7yLyAM4RiA+POAddVFfyLWUJjdlNjw9qyIJdOITsodRH8dofr3VvbhLO5s9EaHSZf55CKwNAPUasMjr58GeDbF1Zgo2LxpDU+eY/gERXyKUgg8T1Ba9xQ1Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672942; c=relaxed/simple;
	bh=/qw+6cgxkzZZBOStgEQx1eIAh7iQz0iBbj9/mHl+/ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AePOQGnZmDxJodS98cC2rbYhM6CMay3zSzpu49+h8rnTEMeJYRMpWHGF/cUFyv1ig/8AV5DNE7i9BB3/bz/S07sbqUZzvWXPexgxSCQ7fxLRc2X/61Ovc/sZHJkgviw3ejNvDIR1+xqx9Q1uitthhsPLOhjw7mu8LBumi6SqLLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhk5yd6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SuSaY+pJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhk5yd6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SuSaY+pJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlbZn2830453
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a1OWOQ1AYfGNWrhSZoED4ivR
	typluRw/+ihjuHfciiI=; b=jhk5yd6HCdhiJfdjZyk/JcfYrY6t437VcqvtUxCM
	NxRC8++N2cUCX2aDxegzIc6+P34hxOJ86NyI2NOYEqFXFRIP7L9Bu0XrcuyN5G6S
	EK1Pt1qaFsquhgSM3GUwSZJmD1cthChOoWohQ+RkcgSKmeiSZXwkMLLNswKu/YmQ
	oD05t8PYlS1V/DEA6rBOV9Qy+S2uEKgsKVBCNkqMIcqsT2QFCwcYudCa9KN29tz3
	j9ky48nBvSCapH+EoSQfTabfzZ0ZSnXDHbdSlnbVErw7u6XPmOj5myOM19Gtd3Xg
	yM7VPXLtifTrfjVnxU1HcmPVOEhBBWopcmgfJp20N5v80Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a93g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:29:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-526da7e3c9dso18639531cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784672939; x=1785277739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a1OWOQ1AYfGNWrhSZoED4ivRtypluRw/+ihjuHfciiI=;
        b=SuSaY+pJIUwZ6LRU+slrCtxJRulU27xra3jmvaZkqWZqG3VXEle03EXpRnIMltDNWL
         cnX1DgAK218l9BrpyyWmxOWOrJ/lHqnS65Ki42/Qvu7NcwAnW0B6Hmbo9qB4zA4a2YsJ
         pw5LkHrTbA4kcWguOkC5xhkczmL6N4zbT7Mv4exRweFa2v55aT/vHvFcmMOKIobZtddt
         ypp7V/6mLW/V92Tv9+/2/ElJlpL9tN7wMdxStFmmj3Y9uMTsjxFPy5b+Rg7ZPFZ+yG3I
         yuZfI/YWcMZ39tlWenUiUdm+s4bPCIsBSA6sSC3IRzuehvYMpps8O8LswcYImjC1Whrv
         plug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672939; x=1785277739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1OWOQ1AYfGNWrhSZoED4ivRtypluRw/+ihjuHfciiI=;
        b=EB//8bDlG+WxYw5DqxQvAFseXT//UnDu5z1zpR/0d+ftXbr2fPOHrugJwnQ9nST306
         eJrBTa0Nsq8fUl1iFVbOnqpgPDD4yaeiF4Zk8In5gdDQ7Nh3CgPEQGvqPWLMvpup9Yil
         32Z/BvP0uNrf1YjjgnY8cJmwxniOD7ipw/Z/54KoeqSPT+K+MgNGY9sU480NfrCxxquP
         JUF9AHZJZF74nXcZd9AMAsKAz/oVFR2q1eHQ3vZUDX5ddukha3XDmVCq2nlYDhcwbAzy
         2GP2ICuY3PcdAK9T14CpfjiJOVRyBvaMSbwXWL/2Rj/aprI0jc1mX5ax4PEQt1+k9SiB
         xvlw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9F7tJvy2U5ptS6zHucbD+/DCorIoNKDwzkBdh0xt45a3RHO/H8ixynW4kegwQuYveGEFdN4wjhWSLvQk0@vger.kernel.org
X-Gm-Message-State: AOJu0YyAcBu3Jo4DNJUToBYfmIgj9QW1Na1xiSFJZBhsYXMMu+izS1pT
	dco3YOhLTLCspidRBCRvNdxrwWqoWEB+jfB9OCNpfRmR972vd3FC/d/tBESLh1N0Y+HEkajQiZM
	cm4UFTbr+S0/yLnoY4bIL/gQ8Ah6xN7e1gmqnBfw6GZcngjxvxKTQN2DjWhkKzarAdEBd
X-Gm-Gg: AfdE7clgQRAqcf8BhAafRhY9rRi+qwaFI7GtllhiRfl2sC2/gj8ZaIfPGfsfgV4P6CW
	ozCoPlgRzPO/Mne8RSWudIQwAe96YMhI61CW2LXJ2vPFJ44hakk2DuIBqRFLuJjzLM2TDMfHcwM
	I7zxz8w9x68G0kowanhsPu7QIEXAKAxQ5Xh8PdAdwmrjVENPi+2bKKV/+gJb3+pdzWCDrOMzf2E
	R33rJKRKwtsqYpmMj2F/mHRoCLeXkc0pRKLyie3FbuMgw1iYDlIB2pys5qKYyTqWhm/QdD2CnVZ
	cRihsk2g6PogM1vLW7lQ/C2p4u6hIMnCD6WglvRBwxl17GqBA0ZEYEflLud437OdLTjM1M73uPP
	XkgoM2Zy+Jd4cllYylv/R0Uwac2doojvqhvII1OFuRTMohzMM+p+FrBt2Np+7UYhHCVBxOHVvji
	U1sTtkmsb772bl+Q==
X-Received: by 2002:ac8:7dd2:0:b0:51b:ec34:292 with SMTP id d75a77b69052e-5213daa1d26mr199225501cf.53.1784672939486;
        Tue, 21 Jul 2026 15:28:59 -0700 (PDT)
X-Received: by 2002:ac8:7dd2:0:b0:51b:ec34:292 with SMTP id d75a77b69052e-5213daa1d26mr199225321cf.53.1784672939006;
        Tue, 21 Jul 2026 15:28:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68883fcsm1367471fa.8.2026.07.21.15.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:28:56 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:28:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Message-ID: <5wjbvw5f3vpbdkh3wvk6fvs6rjoiqwv4u6gsmbhuazgelibz34@ujb4tfsnldn4>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-add-cdsp-v2-3-e1e52bfb3c12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-3-e1e52bfb3c12@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzMiBTYWx0ZWRfX1Hsvg9ftjif/
 hW7kgo/oyI3Rw9EATNidhQ4VBbcaxly6yHCMxauFj7CLXR9eF/1hhf8TV/MChYg2DOmfqA2EVj5
 9rGkFM+8xedsEkQ6Uc1mD0gF1hkMHrsr15ct2nwKWXSANcw4rx5KUEf098GUOea4m1aVVH+Tpay
 FAvLW+lXZZ2YBQ/yVs2kdaKXSeidVSqXIUvNL9Da2ig1fyDkojdz6+7A5Ff7bUqa0xsZUxBrpl0
 5IR8zsM8sdXBEnsuRENTw2O8zkM76ttqY+dLf9c4t2+P0+An6ihe6e3NU4k12G+sY0QtircZ1LH
 9MMfx6KULogMuXQLv1T7fAm+uBQ1hkd7VV5ZNzZKN0vM5SNOvVWgYQWFMa4/fQ3A/UO6sG0hLp7
 ijkrutoepFcr28WqHkDOgQjad6bUFSgQsihcvs3jEIc/MAsSmZKGDfF2soEcRehbJtNb8nQrFiX
 S2nvkYQU8gz7ahRGv4Q==
X-Proofpoint-GUID: YvWgD-06F8O7JdByrKAXWiBtUfHKImlD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzMiBTYWx0ZWRfX3T/On4qfO2MI
 aoecrNZCBUXf+KGEAlVJ1BRdT12xABcGka3CEqffTMAvIeyX04PPmGfTbNPbQWaFzpHR7tB/z6I
 5940RxtLp2HNsFWi0iy+O5aHwFLWtR8=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5ff2ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=l43UT7fniQhDvcVowC8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YvWgD-06F8O7JdByrKAXWiBtUfHKImlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210232

On Tue, Jul 21, 2026 at 11:25:50AM +0300, Abel Vesa wrote:
> Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
> firmware names and marking the node as available.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
