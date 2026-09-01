Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DDD46A5EB
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247587; cv=none; b=Ydy4ufrH+7No5m7ejwF/mO95yl0cHthvsIfyYpTww8NiwZjZlw/4Plw4y/ZA3gW735O47O2zRWY0rHIC3jThwOkCvpensY6HXL+lquOM6oXqdaemwcrIrM0hsxWEcWoc93iEWuQLl3Dtpmd+CnptFDNiUkuhjNSXlftb/S+/vKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247587; c=relaxed/simple;
	bh=a9DqKCNA1iCgEPyNHVkOQxKyQBg5z3GBAmuX+hxQkzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lydv7z4KyAUu9W4ZOzlpdz5k+rqGAjm1sX1M+WLBuqxJC/0KbSdkaniei9GbunRSQ4BJqxY1yUZZgQ+vn4q3ma7HlsKY6OyikEicuVe4wFNvg59MmmG0Clerpi/EqkhH0ohNM3SZv9ffySfOuVbsNsxE6a/+bDe68gCvRRCnSjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VafbF0JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFhLdaLJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VafbF0JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFhLdaLJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Jnl1709548
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 07:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SyyheYKwgD9MhO5a2LPElNl4
	00Uc8fYDajgPwssWuJM=; b=VafbF0JHOkDOl/27cWqAPQXLmE4AUGMUOd2FDfcE
	pKgjxUgztdRZ2b0tdxdMhpR6YodxzFp1DC5Mgg8DlvprceFRmJXJQEPsGAQtkPeH
	VuND4z4UaHzL4xcjvYaqMHI5B8lclep1ZM5AwwoTw4JTMNeLiS7RdHIq+Nxr1S4D
	utI1BrpRPEkqt9+9xnn9G3cYhPIxSYwvsoDb3ezrEzW9wOvA7CwfwyI15jgMc80Y
	Qbjz9puQl29/rszA2gRoTccazThevOngjFoZXqG/XBjfyDogfHAcC1u40KF0yXlF
	xv7eXn8Md8Vpvfa2KbwklPQbehguo/SJzOcgKj5ss5MBJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs099-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:26:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938153538caso111102685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247583; x=1788852383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SyyheYKwgD9MhO5a2LPElNl400Uc8fYDajgPwssWuJM=;
        b=VFhLdaLJQ3Fy+RhxRx0vRruKw5Xau7ZDHv5WAsuwW7vcy1lgq87zC4yZqXs6O/Ys0Q
         uHUEUD3x/CMfdwgXwomV6BXihQ83ESky+mQN/JyAS1ClaM5lNNnHyWV9dbvyqmCFBxin
         ALn36l1Ee0Kk/es75iMksNLLaM3SS9/JzX0kVubRHWcv2LIp+oL9PIuIDQB2pwnkLSGU
         KDMl5ShbaoDi+RE5n1zR1Cngd95qaYEw44y3+P5sJMG8TFK7WQoRLerTwaTW9OC0hw7Y
         MCHnULuv+zHYBkbI8lNywDZWjTvyZVbUuUy2osnEErI1jBLep5gsrvZZQ/XKE0BmqXR7
         s2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247583; x=1788852383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyyheYKwgD9MhO5a2LPElNl400Uc8fYDajgPwssWuJM=;
        b=cHlqkiY2t44+g/gfVYRInCc3lUq8Sxd5qeMWQTdiX6qWpte7oAPcq46yNBnfJpNU1f
         SuP5ifCpAOMERCPtdt49Jv4/vr1iIorM8ve6bUWc6QzeQqeHdzym8Snc02yZIuvodRpv
         s6xd9xuSG9dVd4FvoK6KPKvfZwRrtxgoHe+462w0DRMOjoArbRM0QyKrp40KpYkt3cS/
         GljbgT6YWjAEmfK9QpjRrPx8hnBAFvURJXgZ9fcHvO6hESXn7LYHSuUqLC0CgZnbPPQa
         V8E5iUfoKz99kup9LeV+Gjiqbeh6p5QCI+n+VOHOAzofjhm/GWZK++BSHDCO6NgasSlk
         ByvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpx/MeHD8O0drvWs/lkk7MAPPDkLOnijDBgzl0fdM3IMwRTnpujznFeSZo3Ijg3iYR14iD4pfvj6DPxcrXB@vger.kernel.org
X-Gm-Message-State: AFuF++mNmDIJEBx9CK6ulPgzIgzWc6CqjKSicvL/M7vDa2gEcOO6ponm
	buxF9GtvkhlfjiH1St4vF/hCFTSldRETMLaaEqCCUAN60sozkMUpcLKPgAp7TkCNFJzm0rpx8hg
	UVjR/PQorU19jcqXuR+AznXN4MW4P7sTF0H1Apo9aq0SXtmRLmPO5/yspxbARoUsNRuYW
X-Gm-Gg: AR+sD13I7Pnl98eN3h85oq/xqlA76MCYgY9JgVl5bRCWv2eVuCWwVP2tLFROfMf8SVg
	08rJ0GBIob0lg5xBylUzcXjGWRPhYZpxUi2GkXX18IL5dVAMPubcLrCoibng8kFtXaey8BRv9pE
	ydjsXFxeLaeJFOrbbkm6tMmWf8Z/uNM0vQhlerTPtT/BlD8iUJDdgPQ0t8Bs7LHMXfgew3PX2D4
	Ie709s5hjEqmo+Lyom7RukU/MBNLcPwmp9G63c7NLJR0dsgL8l28olFMtoO9fi9Pm+dUgFnDIUK
	JRkCqhz4evLT6PvL/up1nhR8qPc8cLm12NuCzxg3B2IWMM5bcyFetF18lfLVkmRWbW6RF8a2esv
	1O7i4+j9C6UUDmA==
X-Received: by 2002:a05:620a:2908:b0:934:81ae:6d1b with SMTP id af79cd13be357-93913903c4dmr3456672285a.22.1788247582624;
        Tue, 01 Sep 2026 00:26:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:934:81ae:6d1b with SMTP id af79cd13be357-93913903c4dmr3456665885a.22.1788247582113;
        Tue, 01 Sep 2026 00:26:22 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1a3fesm48344405e9.12.2026.09.01.00.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:26:20 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:26:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Message-ID: <2a3ofethirhgwfppu5y7oralqvcswbsral6ylcgniojetd5bma@puoiewtiavtd>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-3-elder@riscstar.com>
X-Proofpoint-GUID: 6PWO3-DZbRgEsUi_j6I4nYQcLilQ1pRq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXwbr9pR1NeH9J
 304gdU7ZghLga2WC/tiDhqWc/D7/iENTISznDQfcKcToXPZvagWjXpJYv2zW0xnExSDFs6+umjV
 zu2iEZBYRkMCYYFtzie832QgWqUM9/g=
X-Proofpoint-ORIG-GUID: 6PWO3-DZbRgEsUi_j6I4nYQcLilQ1pRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXxVSUvkJTD4yL
 yfGhsbqMemQEwdiKj17XaHSTTnczLPUFt9m2INnz1a4cpzJ4Z3bsgeBF5hZ+0UDVrJm0kYLMZ++
 egVf+0VYQ9VlbyVU8ix9jlk2gjZU2Ap3ppAxHQX+HPGNSs1J+p8Y/H0kAkA/pe9G+kEqiIGvvsn
 7CPA01fDRP486y0tNGnmDxJ+c4yuMNE43gFq62bxNDVrc0J0m6pjyqWrM1EyYBxsmZf9cP2igS/
 9R82WliH16KiD0Nb+YOW/gKAA/bxKrp7FvonVvss4DR5lgwz2uKRP1hMmikZwDv7MuuOJ4VF1Az
 F575wIcMAJZiI2Y5tQck2+NhU8xT7rjepwX4bklCFWSlMNFtRxHzPnZk/15kpTKs5K8TYWc9mu7
 Rb8FO95tivZaoDPwr+h8ztwOI+FOwC0CDBSzxXwUrPm4Htc3MZf66B3xWWmXaWwoTG5MVn6aYpO
 v82fd9qikw9O9T45QxA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a967e1f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=FuJlbAGUYoPPbcebnI4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066

On 26-08-31 20:36:49, Alex Elder wrote:
> The qcs6490-rb3gen2-industrial-mezzanine overlay defines two nodes
> representing TC956x chips, each of which contains a PCIe switch and
> an embedded endpoint that implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> properties as well; they can be added back once they are actually
> needed/used.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 4559b435f741b ("arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
