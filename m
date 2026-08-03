Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069E33DCDB1
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748986; cv=none; b=m6VujIZBaKIUB7+i1mBR7WXcrFvyQit9RF3SuZ4ZosetYOUweAyD0x8C51yNInb/KjjM7gT8HTEXaCwUhgdzPW/uXMpZK925c+6M1FVCSg0B/Rrhe14CPhj9l2SlDdgG/p1ej8MPIsNCzOYOrB8PmYIvP2S0FxT3u0fYpwL/kiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748986; c=relaxed/simple;
	bh=X9+2nJe4ug/gASVKfosspTsFtedg/NhqFpFbQqpYSoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdFjBS/cWWkDPjZaQurbtHmpuWCHndBjpAlhkX3y7x/DkVId16Q932Arx1qp6y62G+itSfWsMateg5cl3uJ/ae/GLEoBNowWUj13+ot+WUdAmDSUSfzILSLR6R+JzWFIticVkn4qP4Rm588j+vY1MgqOJGTwkzfdo3ZIyy0LjS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIB9ZVgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0I96Iy/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIB9ZVgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0I96Iy/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67376nig3961171
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 09:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1xNhHRmjBylVBe+cBFr9X9Dw
	KitUCaw4odoWX3q9r24=; b=KIB9ZVgRp/HQeDoz/1B9+P/rHvjqgoJcie7rwDvY
	K+RX+SoM5fuaWyAGMUN5MOg1EbyKis91D/4QnaDFkmXoGZkJJk1mkttWfPxdlyzN
	YeAtOB7IATpgBFmzcyJTSGtpCtH1csoQ8meog3+Jjy+65mdLtAw7znNOyVQhsGq1
	bso+Z9rBnR7Rv2krZsl8Ubx9i/QBPSjEBZ9s5O/+iLixLvyUAHkSnTRSaNZpTV9y
	mr9uKHuOAgGPCQN/2WPNhCcvv21AEy+jmlvApaoo2mKG9UDFauyx0OSCdcvGlfYS
	5yOogT5mPrHckBbTCQRlxEBrzaGgVV3N6KiW6RqzZqUzzg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajepu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:23:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848d21bbb55so5860576b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748980; x=1786353780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1xNhHRmjBylVBe+cBFr9X9DwKitUCaw4odoWX3q9r24=;
        b=O0I96Iy/kiJEhFIb1wmsC5PAm4JG0P0X8pVajMnLdEDavLxrUu3fhu1QuCn8HHUMJi
         mbaKJzTDs1XajAs3gJjkgr25kZsEkCIsRQBwpxA3Kz60uH6E3YsfIjaWpQ3+cbvAfM0h
         yGZfVtYGyelzC8RDOQ8CaWuFrYdPo4sNDgNR+bdqUlYFNCW550ouyATRwEuXylaXTY5H
         ox1dyAf9ttXQSgY7024++4Z7Y3HmBAHnTZEheSPO8yDWz+58bMcKrv/BQjTbwRMlGN66
         stbfDvVyQAten75/B0/yBwvKKa3pr/oA0WS1QOCEgHIDmaqQZ6hkfg8oLb0cOLrPlMPG
         Os3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748980; x=1786353780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xNhHRmjBylVBe+cBFr9X9DwKitUCaw4odoWX3q9r24=;
        b=nErpi8eUmEQgfyysToQipessNT15AB9wddaBqO/DxStb/BygrDxhzmiElqigFn/b+W
         RexIGucdgXq/iNbtVVWh6jMxqZM9MQSGhOCIgijndVBwRq/KNRMxTiOZnrgx1W12sZ9Q
         fawv/Gq0iizHHv/z1XHoPNsE0z34yQZON13G4DJLKhukjzd0Q6vbOed/5vysICCnuUnL
         9EFPmAQvguo1zkWpplNg8r3dfM9DRo1HPQrQ1moMMQ4KqyUGqVzzqiLwT922ReQ6Poe1
         /EKC8OvmZns351HfH1xkbmEUECtNmcojaWMo3LEpFWVnGMtAoYaRvjEAVK5LLWK+ZVOQ
         9yhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIbFhb0cyXhkvDairCtfTHAD5GA2WVvRCqaZtENUQUnXAwrv0zt0s9Xc/qFFtm4J1eTbP2W5aIwlDJi0W9@vger.kernel.org
X-Gm-Message-State: AOJu0YzqShZ7yXBPDyATV5Ccsus4wpAi5ABe8e9D+bDBzA4tFaKSxXtC
	GlRiW+W0pYw+XDNqQTRjoEstIxjjO0Ev4HVt5aLPHbH0CTgEO2vknJwKKk2Exe02ci/NuBm7KPb
	FG6vbsKARB73h0VxE7TgEE+lrj/oQ22EihMELWOB/u91C5K9B/S1urBbjZ2/0UCA7SuWX
X-Gm-Gg: AR+sD12Z5HC5pUw6E6LvWT1/evUWGTaWcDag8ucWgx238jGPgB8PYM4hbny1pf5TpUm
	3JQn6uxeBZ2+2rdNH/U20xD4UYgHGpjO0pzwH5D50eEZdl5iWRllXjdFUhTFhVara2y/C+Glffu
	NTx3PqtrpXpRBq5MwZfEnexM0E1hQp9o4uO40vEF4kHlEcCyMQOQb/FGhEAcoWDqxHAWP1dFS83
	Li36W0ubMOpJSvnhW8wYz4C3lqgSb+LUiiu55ubiPaw0/V68VeFcfMxrkeBe/jDgVwO1Hjf1y6h
	ZPF8mpxUAZIh+OfUZ5BGdJM6HWzsw6L0VRbCHDt0KKqO8p0NJaxmKyrBOqi3sviAsQzZmaWSEEx
	YtzBLc4BhAGZ2MTpZ3WnzuP6gXLo=
X-Received: by 2002:a05:6a21:648c:b0:3c0:9c19:658d with SMTP id adf61e73a8af0-3c92a89b8d5mr10122645637.71.1785748980307;
        Mon, 03 Aug 2026 02:23:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:648c:b0:3c0:9c19:658d with SMTP id adf61e73a8af0-3c92a89b8d5mr10122611637.71.1785748979783;
        Mon, 03 Aug 2026 02:22:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fc98sm36259828eec.21.2026.08.03.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:22:59 -0700 (PDT)
Date: Mon, 3 Aug 2026 14:52:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org,
        gregkh@linuxfoundation.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] phy: qcom: Introduce USB support for Hawi
Message-ID: <20260803092250.ucoh5qnnnyurgyzu@hu-mojha-hyd.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
 <chf57j2dkhhjzigpguldadfld5utepa4sxwbo7fjxk5nq37bhp@yci5agzh46ly>
 <al4EG1FMrI0z1D7z@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al4EG1FMrI0z1D7z@vaman>
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a705df5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BafedZZDLhzKb9y3GCEA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: RS6I884G9lMVjhbmJZVfXXdzEFtLrk2u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MyBTYWx0ZWRfX90eRUQOmrXx7
 BesE9a0aocbfyQSk4dZ3eX/fdzjZVHl7fjkiw9dDxFeUF7TxTDXz2zJcpo/fgLzqFHmsbp+VZ5I
 33zdVeo3ihfB3DzS0m+Yv1QDwFn20DI=
X-Proofpoint-ORIG-GUID: RS6I884G9lMVjhbmJZVfXXdzEFtLrk2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MyBTYWx0ZWRfX30lCFM5Ez0n+
 lfZ2jB6XJr4t7Qvn7WH4MooOjh465Qm8IWjDO5IgvKR9Eu2HkdXdnlO81YdRFlCBMSqeZC5/h7I
 g/sr1PhADTfBRDIzsZIvMqpregHAURS65Q9CdvfeAAfLq6xArqyLyeRYIw+RXy8LQb/egoQtZ5O
 N/uq9HTiY41Ueherg0q6nYYlC3zpXUm6PteROIm+JIKda7uLK8ofbqcZwc5Kf9Lh8HwuWa5fBep
 APnnQsnwKHvNih4WYx+n1gEw0fA8vpgjl0wheX8LdTlPByAXpz13xoT83qIhdf/xa47q4vhJQnX
 ypipqlQwBDwqFDkQwkGi3d8bhuJdSGad1BkJahr3w1YfOUzG42ZEaKN5nJba8Rf6y9y6Ha2i8et
 +RA5zbq4//kFoiHeJ7G6ejEM513I3hr8LAvOgdMg6a1dLcLApODkjOScU/wVQnQGv6cAh3uhGgc
 4l9l13Yq7fLXO6XP9SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030083

On Mon, Jul 20, 2026 at 04:48:51PM +0530, Vinod Koul wrote:
> On 13-07-26, 13:12, Manivannan Sadhasivam wrote:
> > On Fri, May 08, 2026 at 02:32:30PM -0700, Ronak Raheja wrote:
> > > This series adds USB PHY support for the Hawi SoC. It documents the
> > > QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
> > > compatible to the DWC3 USB binding, and adds the PHY initialization
> > > sequences to the qmp-combo driver.
> > > 
> > 
> > Vinod, does this series look good to you?
> 
> It doesnt apply for me, can you folks rebase and resend

Sorry for the late response, sent the v4 here [1] rebased on next-20260731

[1]
https://lore.kernel.org/lkml/20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com/

-- 
-Mukesh Ojha
