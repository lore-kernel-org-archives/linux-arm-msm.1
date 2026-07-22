Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D13546E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728784; cv=none; b=s+erqDKAizsLAbwLrfwySZTORiJYjg0Kl2I9SVD0B3avbUKOIBcSaEIXYB2MjEpMtSHVjx4bJV/9BXbl9Ad2k94sUAMOq984XlnYI1d0Xuet+0DCt1ikyrtGqCkF+IuTuhPR90mZgX5E1QvTjRxQvZKAVKEH7kdsi52idrRr7+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728784; c=relaxed/simple;
	bh=X3XZ4W4x8YcQNk01qDYADfM5x3IioTEjoaErDOYaqm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UA0W4C+CklZBA76GaoOeTjD0WjGDwExLBUGTAvYFd8zHLA3nagIHulPAdwsvwZ4IORCw8v70DD9UCRj6anTN8C+jl1OelP3sBA3Tt1VUN28rQNTKWKe2Fa6Evj0tZRxBXFoHkquousHK/rc9A/J0121KZrNc3w849Z3mw7apuoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSQYV4pc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F54blrft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSQYV4pc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F54blrft"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWQU01016995
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2Mn5WJa93KoG2qDGfSidg+jkhRfYzxNXyR+6PbWzyA=; b=bSQYV4pcZXO/bBxv
	QnzIaoJGulQDljE5fZ19wqDcZyRznMd2yYDX34ruX6MQ7p+GtcPdWGef2GUrjhxj
	98ac9FAI7JA8J5l+jGcafbvhgSi6rtvdI+8wrzFx4f8ZIE1w2WsvJJ2BUwWpN3t4
	CT4Aob3wFutCmf0BJcAe/725wfTGng13agY7b/BW1g53ZuVqWHsfgQMffguBJ4vy
	lAsEkC91Dsm8vtTmocHLnKXnE0mz4unzuNPy2sQ5aJOsn6xhvEVgkxOqtmUIzq2g
	CK5jcg8BumecP96ROcAFhaeLNvfIQhkxoVnSmsZxFS17MCxqQrGhJ6+v4RMpbv/p
	KQWEqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs929nnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:59:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so193494341cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728777; x=1785333577; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k2Mn5WJa93KoG2qDGfSidg+jkhRfYzxNXyR+6PbWzyA=;
        b=F54blrftEgOhyhPPir7+tbSQ2SrilDObFCjMv09WYzRX9VxBSrkE90rfb+xycGRLfj
         /kY7QZkEgdsSvjxO6CCwYMa3w61FXh/EXQ1bY3lsarlIW5Ij0kiDljOt4JXdpyLyyRm6
         dJKXB+lu7W3NbbE2gtMg0wByZ/nSB9CysWKzZBPUnojHhM5XuDah4tqYaOCxq/HVqzA+
         ZKNINZshwNnUelEJ970dzk7RcGDdczN6q/ssDUz24DQpnfqVdnhHsU49ePr6U1H3aYzH
         Rq5n0AedJdo3h9efgz7dBl7orLDpObEDWXcdMpDRblo/hwj6KRzKAIpRkBrfr9vh0z6f
         tEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728777; x=1785333577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k2Mn5WJa93KoG2qDGfSidg+jkhRfYzxNXyR+6PbWzyA=;
        b=I07I92FPs8T4tvvmJhYQ1KnMRdDej2N5/fi4bc8RSI9DugdX0u9OUFpmkpglo6n57c
         STfArfHz8Ve71hPEf3urjtJ/zVZ+ln/Hm76+d1Du87/OhD7HtLwsGscWJiaEXPKHGI38
         PA6LuHe01XiOVqc+jkQSKCro6XW6gzy5ZLyITnvO7ujKlemanQ3N1+CWCs2jG2Ok1B9Z
         W1YYeTIRJheKov3QIT62NTYNUr/8zNDIysU+HH/JggV7V4dT5wxUJ486SyTLXZjQrvle
         ryblAOzhWxNHKMRabvEfAwSs9rYEharmhv4TBN67czVhrcVsVCssCrUgZ9rzzeoSpuRk
         rQMA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3T/TAUtDGhQGQ+rqrumsMsZNRQAQ1I/DGXquSDqAFlVnQTCjgONYrPPCWvmJahky3k8BTz3+6NmgOHgwC@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwGPBM64kUqTjHz8KOvw8GLA8nPUGv8/GbJ9EbqL/NNUnP44r
	7u8UuWdIcPzfRUyAxGWxML2Dcd4DBgUQsHFfyVygBFh0MJhWwU0HGtDWONBlAWAUEezCYhARpmW
	d8vbfGwK/yW/RJ/4bxf4OvmuWMTVDXJanc0g/pHxo8McS+xAgpl+Ao9tUDQ0za1atqU8h
X-Gm-Gg: AR+sD11EP1SsXPgDYqxrN5t24QzXYC3oqZv1NZ1VzLMhqL7UGx+JsEHK9AZ8RCDfDY/
	4QmEQWbJ7P6jGXPsOVA8sHtxH+ohUVLlF7/Ye9P3Z82Y++Kmb7N8WSjJT5hrZ10CNEK3Ctu6Q5L
	ZBZWEOHqNHXGc2QeEb6sqXnrIadtGMhE0i7SFeUH6ThZL8vX46Wt072x8wqLh+QHGv/hfhH1u9h
	EaLCrAXSGXegUilDaTgaTAPETAAwDr8J3JT3gvnCzEyxyG2JXLO+xDc4uEDoEt8oB0a387G9mc5
	1MjByPHhPF6r43zt9iYtyvGkNMxfnBgXgHn9jJuSW2Fj2vlqGou6mFAjenIflW0VDCmEtMq0R23
	Kkr+gJxaGiivMTC3SplGSWNB/URT3XUf1iULB5KL2+8nE8mGzHrU5m1rtUWhal8RF0PiyRdZ7y/
	+1gVFUVl0lcGKHaw==
X-Received: by 2002:a05:622a:1f85:b0:51b:f549:c706 with SMTP id d75a77b69052e-5213c0081f1mr245231331cf.16.1784728776307;
        Wed, 22 Jul 2026 06:59:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1f85:b0:51b:f549:c706 with SMTP id d75a77b69052e-5213c0081f1mr245230941cf.16.1784728775819;
        Wed, 22 Jul 2026 06:59:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9a7f6sm499957e87.18.2026.07.22.06.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:59:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:59:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <gnmx5m5dt5676oox5cypzg26vbwtmzhzkh4bhyq6z27kwi2bf3@z24ov6esgtx4>
References: <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
 <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
 <20260525120139.dyfnm6nwfzuoxd7p@hu-kotarake-hyd.qualcomm.com>
 <20260702113010.zjrk4kr7fpjp6asj@hu-kotarake-hyd.qualcomm.com>
 <dqe3ntmtmjqixp2l5n7qm6zpcwh4sizr7jd5g3cl3tzpvl6tvo@casnjg3orldd>
 <allz1-dD9V_Ck8LK@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <allz1-dD9V_Ck8LK@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfXzUd4jrAoxuMB
 rNDT5s3MCR8OSUcQPniDnvtJcamciTSU1AqvwPtXYY+cw5O6T8f9dYeeMF+5qSdIgRv8ZEShvzh
 NjO6z7PPH9ufELk3lTRobnJJi2UoY4I=
X-Proofpoint-ORIG-GUID: DVoe0-YKxzaVU5lSPHdo9wvdGIlGyIX4
X-Proofpoint-GUID: DVoe0-YKxzaVU5lSPHdo9wvdGIlGyIX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfX0fO41joCXADm
 Us3PDfm37uM6bNBxPPzEeztOND+Br36BfVbgAwU+ClAhY/4rii9EIJ0YK57oGTbDefp1/bdaYFA
 xwJkezU7w2+49HlqUeQN0RRsCiztizv7/o7KaQQl93/OKhgIhD/OZzDB8zuY/Sx0MC38vDQ+7Wu
 SJ1lbnRHd0AJn9Ac9pPhOZlm5sg17WNYDvSoMxSBZ0aSxybsp1hS1xhb7pSgMr4GL/TtBFklkKp
 RNCJmMlU6S4hPli4TjyJUMHYl7phDov3Cs469+PNulLtK9bk+/SSfHglMPSQoMtz4VjxUBGLEnC
 aOSd5XI97HKFWY2rXxgWq5Gmd7FnOlv5CQPX6n9QU7rnLiFHbu4Vu2zEPfDtk5J+7wwGpzlxtXg
 veM8tY9A1LKx7ScUdt+quU6x+PHPEfa26WI330QV7v1vlecBNp5lbz05vT6AXvyQ8WQYCjLzF/c
 xFbW6VNVqpoQ0dyhEeA==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60ccc9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=V-RYIpRGXYYGgrflbjwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220137

On Thu, Jul 16, 2026 at 07:14:37PM -0500, Bjorn Andersson wrote:
> On Thu, Jul 02, 2026 at 02:49:37PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 02, 2026 at 05:00:10PM +0530, Rakesh Kota wrote:
> > > On Mon, May 25, 2026 at 05:31:39PM +0530, Rakesh Kota wrote:
> > > > On Fri, May 22, 2026 at 11:24:19AM +0200, Konrad Dybcio wrote:
> > > > > On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
> > > > > > On 21/05/2026 10:46, Konrad Dybcio wrote:
> > > > > >> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
> > > > > >>>> Since firmware does not have a way to dynamically tell if it on a
> > > > > >>>> debug-board powered device or a DCIN powered device, We are required to
> > > > > >>>> add this new DT property.
> > > > > >>>
> > > > > >>> Neither debug-board powered device nor battery-less will have
> > > > > >>> monitored-battery, thus again, why lack of that property cannot tell you
> > > > > >>> what you need?
> > > > > >>
> > > > > >> A device with a battery will not have a monitored-battery either
> > > > > > But why? If for such device property "no battery" is suitable, then for
> > > > > > me "monitored-battery" is suitable as well. IOW, if you say that having
> > > > > > a property describing batter is not a accurate hardware property here,
> > > > > > then neither saying "no battery" is, because no batter is basically some
> > > > > > sort of battery (just like empty set is still a set, empty array is
> > > > > > still an array).
> > > > > 
> > > > > The battmgr service running on one of the remoteprocs already has all
> > > > > the information about the battery and it also handles all the type-c,
> > > > > PD and charger configuration, only letting the OS know about the
> > > > > results.
> > > > > 
> > > > > Hence, unless there's some other hardware at play (e.g. for custom
> > > > > 200 W charging), which wasn't fully implemented in the QC firmware,
> > > > > there is no reason to describe a battery separately, since the OS
> > > > > can't do anything useful with that information
> > > > > 
> > > > > In some abstract way, perhaps monitored_battery = <&pmic_glink> could
> > > > > be thought of as valid (since that's the data source the OS gets to
> > > > > see)
> > > > 
> > > > Should we use monitored-battery = <&pmic_glink>; If so, would it be
> > > > incorrect to mark pmic_glink as simple-battery, as that may cause the
> > > > schema validation to fail?
> > > 
> > > Hi @Konrad Dybcio, @Krzysztof Kozlowski , 
> > > 
> > > Following up on the earlier discussion — is monitored-battery =
> > > <&pmic_glink>; a valid pattern? And if so, would marking pmic_glink as
> > > simple-battery cause DT schema validation failures?
> > 
> > I'd say, no, monitored-battery should be pointing to the battery device.
> > Please fix this on the firmware side, so that the firmware can report
> > having no battery at all.
> > 
> 
> This won't be fixed in the firmware on my devices.

Why?

> 
> Regards,
> Bjorn
> 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
