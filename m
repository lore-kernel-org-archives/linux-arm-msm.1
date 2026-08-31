Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A86F3DAAD0
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165160; cv=none; b=gMgRBCcvT/KyDPK424PvsDlU5xZR980Xx8zyIfr7cRoEGOU7/MJnvsDvjYudbWzzXbwmW+tXdLny1+QBtb1tm9EwH7HGjw+e/0Jy7DEDigEm/YslFplzMkOUBq3/bP11C8MO4R+JJREcl4g4e/Wi0xRmwyC2+Mco5V1gsxS7QJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165160; c=relaxed/simple;
	bh=FdPvf3CpJV8G7ERNRTcYmsiCOMxWZLLUICoNXusMRos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W++b1VGcqPiH7cD0qdYUMeAv2OMtAqler5O3115xnBklrzureA1OPdLCopoW/n07hRXxEJ2ctbuTel0Z4mLoh7IFUWto/Xckp5mPlDXkI14MDbA+NyACOofcSIxvqb13Ja7eFu4wnYv9Y0GayI5xCR71OdkHgt1QZz2e3pCIA0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIy6zNC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YihcxCnJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIy6zNC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YihcxCnJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xgZF2419522
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4dne+NCeg5fJw+Wr39CNTdUR
	2y524dRLbe5rTW0CoI8=; b=DIy6zNC1zB4+GBlzjDbD/8D3IeC6MStSQfkLT1Vj
	9ALGyDD/LS4PirLsusTZpAMSb/a3sT78AakyO+wRsJsiSY1uzVQ7SZIkUeyC00Tp
	0SxuurCqWlTGJ1hj+3KK/Sc11k5IpG30NoIZ+YTxNmoPNQKaxz4vYcqCngwk5J0l
	AB30CnsOV4STdgoX96vPeRcNMX6Whpga5Jigax/fm/1DLZAWY1HwXU3C+Bm6Ylxd
	pwXuj1eZVeuBFqp6sppk+oPL66m80IivMmvyxy/EJYwaGUTyhyS5REfZVTESjVE6
	6RUPJGEJFoZxyH2SKV/shdgqtjhYLyn50XeVO2h+ODLMAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6nf2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:32:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ef13b61bcso657413285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165157; x=1788769957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4dne+NCeg5fJw+Wr39CNTdUR2y524dRLbe5rTW0CoI8=;
        b=YihcxCnJYQeZIIRFmeZLCEYQhEDoPVoMOJgeOOULfSyfiz1I3FFG6cFNqX4uDJcJ4s
         KuG2GBtnhYsWsshjhH69C75VBdJDd19GJ3VhFXb7/jQ/J15zA47NhcLvDXrkbucwaqKT
         bdah6YY3fHbDNCCbJZzeGnOlQ3TymD2UBwrh9YN7OO+LipSf503dyyEWwIrnj4yvmDBQ
         BPj3zFUROA8GE/cg1CzoNdS/SNfVMsKLpZTyKt2HRhzGXImH0SWkdb3ljRxHPKcCHnBi
         QrQnWRICqtQb8J+Ov2eej2tq5bG+Rm7FA8GWkwjug/p5VgIdYLuKecvyQfQzPO+tqBl6
         rlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165157; x=1788769957;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dne+NCeg5fJw+Wr39CNTdUR2y524dRLbe5rTW0CoI8=;
        b=I/OThsS1eS8rbo51nhBdV9262M0QSie+oPh8ksYxbUFZXkArrGnGSSk4MkfquSavzR
         XAQ6ba52u/w464LIj1yWmANCNJ6MNZ/M413gj3oOHffXkmbPKgBP5GR+EHZLW12rSehv
         Uj+nVjj0ukUm5C97ObsDfKcr4IOcqEJrug2Bm+CcG+a5WQPoGc+pws2jDInDCITKxSsp
         RkMcRcdY6pBcV0xSr4S4b/CCt+AKH1fP702IjhwpvX25/0h2IikTG5giTdfupwHnjo6S
         x0wTYS9Mcg2TMv1tepImdH/w/ecyO2Vd7zduQUkbdpScW5rhbqufetk0cU1Dm45xL47R
         wiJA==
X-Forwarded-Encrypted: i=1; AHgh+RqbMvc3dZpAUlFVe8vjis9CY9VmMppwo5DOJJcgRAu9G98hURVCy7cr8sIYTk/s6tLCKPEXY6gM18WEUVNB@vger.kernel.org
X-Gm-Message-State: AFuF++nKESK971Nc0VTjikADmXyRsA00bXcg3aUmUQtRS4zZMfWu/ZCw
	0cCELz6nfLfEoshvRKOVPOrSJFgfMywp6DLQtgGEFLZ55dvBvRvepyyPCufIjopExCuBg8lI6iH
	l0kyoGS1R+1CYt6KbpySuWf4iENgs4t9j1ZY1KHJ1RzeueHC+3UM+bla8OuGcQX6EE5SN
X-Gm-Gg: AR+sD13I2gsZHyo6OMLbFPerV7ry70aFwRk3SdVkmks0IoPrMstsYIItNJXwDgWZw+q
	ZVMe2UDJ+ZDIZOqXtkHaf36d0Fdxud9+j1cj0vaAzlJuZSvw0655uxtpVVDHxHMKQ3KuR/4CEXD
	qEZW7gZReQi8izCaRKWbr9JbIKUpGx69/f/SY8mESNomsdW3xUBO566B7EZs3v0eC0pEzvGczP8
	UIi0MbNJcR73lwMtRvlzxFdNsBirWjlGSjwET9hM3rnW9TcnQI0K2lQ9MnNh4usrTss90BxkYGP
	F2q8XBad69AT6H4xzhEwAXx/vvPAxEE5DHpfcYJcCsQs5vsNPYaIS534O8yKVru7sz+UFl8KW2H
	dte6lnXDcfpEg
X-Received: by 2002:ae9:f007:0:b0:939:869:a8bb with SMTP id af79cd13be357-939137d1e5cmr2249786985a.14.1788165157348;
        Mon, 31 Aug 2026 01:32:37 -0700 (PDT)
X-Received: by 2002:ae9:f007:0:b0:939:869:a8bb with SMTP id af79cd13be357-939137d1e5cmr2249783185a.14.1788165156700;
        Mon, 31 Aug 2026 01:32:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cda123ac8sm13931255e9.5.2026.08.31.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:32:35 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:32:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc
 thermal sensor provider
Message-ID: <jwjfvxf4xz4a7rg6lnkrxpnm4c42kkvlyep2rivzgcelrd3too@wat5gp5s6zpw>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-1-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-1-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3dK4ThHlK7v6bfygJ7wA1FnXrhGOkIe_
X-Proofpoint-GUID: 3dK4ThHlK7v6bfygJ7wA1FnXrhGOkIe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX7woxIqlpVVix
 iSwe2qIext/h3qDykLpcUFmQC6sbxSoQrjRFpBdsPHno0sIvx5kdtnneStDpKRcKw8ZwhkMRp4H
 L7ke5r8u/vyVEUeH6StsmULkUsTpBB8AbyzPPzRSZVpRGkSLnsKWyXUVQU49QzyafbCB2oNQpGB
 Q7dF8ZbtT9g69VbFoj9OzmgVCHb9SXuW0ilDvvdByGJ9rgxnP7KTVcH1TdI4u3514qPtNQ+GdrN
 hNQKcZoeIWtcaLUaE3qyrmV5V3Nt/R5Qm6fspPnsAN7swDq/0N+glNCw3HpYi1+2aBLRYoiMzvL
 WwmJ6lqk3DW57i9Oz+JdcVMIpt2mQKSKxHyMQ0rKRKIFSncOlELRSZT+fCJ0nYUqYjCgpu95h28
 GFLmOjXY7o7crvV3yyUcMJIDIAfr6dxxp6aJ+84Guhg+/lXdEKFCeBIu0yuyTB+nuJgz6Hk+8RN
 Ifzu0T3eQx4JyJJmkaQ==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a953c26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AuE88ix3_JtRZqt3Q44A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX7ozlD6g9984Y
 schQ5A3uEtgw0+vaHYCjNHteHWxPCtzq/FPotuLQu+qUa4AhbTd9xWuVMdGehqfpAI0ftp6hVvZ
 Kk4X8104apaMF/IhM5Q2wZ0y6MyIktY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 26-08-30 21:02:02, Bjorn Andersson wrote:
> The PMK8550 VADC is typically providing thermal measurements based on
> on-board thermistors, define #thermal-sensor-cells to allow referencing
> it as such.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
