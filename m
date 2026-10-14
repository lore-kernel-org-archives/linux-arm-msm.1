Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC555198C
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999099; cv=none; b=hmISRxkG+y/n9i10WD6vist4RFsJmJymjUpTKT1jtdpy4YCHdLdynuz/AAXsaACrQ007JK8uW++G1dCYZXmuORnR0SafZ3FYvkXF2Chg2u3+HlK13tBTyfVybPbaXW6HABfvlE82Uat6tUR0Jv55Ze/HcKZ3RX5HoBqbiSAPzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999099; c=relaxed/simple;
	bh=121EF6tgvtQmCI553ZeF6I+UbkvEWY/a0feXoJuQ+5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1fBpew777xqnq6FwQSzlNHSRb5Sl/83kcZzqePuXUHIRvwzLc31uoIj5O29OzGUTQweLmeV2jK8k0FBs0sOA2PjNzDtKv2kqhBPDAzJ94WKBAulnWMRcRjGw96evauuSj0RC2qMrfQNoU/GwAakcS+vG4V8HLYsOK5762JoiAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARxqgK2z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYYzCE8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARxqgK2z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYYzCE8n"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJvv3642821
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lkj6WmLM94TLi7LkJSNtIzaP
	frHo6K3hQ/enHwG6gPU=; b=ARxqgK2zwJNKzaI+JAXUrYvIyxi3iBuILGUfZu5o
	adNmbIs8cWR5bF1mcjdLC0X2gN9qfEbH5rtrGqt/iiKhw8PLlCev2O7dmQfnMqtW
	pgEsyddaZngCo70WOSYUMQNnAaZ583vLR46QT1445VfJPw9lY4T7uiejGi1miA8E
	w2d08GyguICu3r0vPDwOT11FmEp0dlWkJNcqXBdU/5DC57wcZWisTRkKL+fk3vQY
	mfDam/3cu1JN0F2NWJ7PsquCMfR51cnlosF3wy72BN6NsSGBrZaHHdY9GRs5W8F5
	7qbtWK6e9GOeVJn9BoOdgtVz9Y19ujsO4RSKLLg3NxuYLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470ar8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:31:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso140619785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791999083; x=1792603883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkj6WmLM94TLi7LkJSNtIzaPfrHo6K3hQ/enHwG6gPU=;
        b=gYYzCE8nAazUmgO668F6jwWgghVWX5J3kT9opv1/prfq6uVx7Fjs+CXjHBTmV6/D3K
         TvDC/PbtpL4ugo41EmmswzmX+WHNxLzY8zuU027oNhD1YUDPBDs60hdLkZGtKobLj410
         bOYEvEtBxsiWwLA7F03W4bXi2pU8oDdwcgaTrpu8tV3a5AhhZjg+V7hQ3aBGqS1GuqJ/
         wGOVbRcWnEe16vsPRFVzZhZ04ooaXkwr/W+rGBahVVY9Wml8EVgWEAPQhQ5EtLHACctv
         wsSbxrVinUvFLEwvfwVuyi3xweTZWdbzW1lTsEO7aBO0MMyWXbRLfasL9vOITz1oYVYg
         8ATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999083; x=1792603883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkj6WmLM94TLi7LkJSNtIzaPfrHo6K3hQ/enHwG6gPU=;
        b=kK7VElL7Q+t2Nv34jxIL4P5pgyTQwLjTOkDmnFTgz4I1/YtjnilFeLYQ8ZeN+/iRQ3
         W4aLi4FdUBWzRH8SVEBHZXemRRcFNKwhAd3yHrVD1GyKH8ZFlqO7I65jJwDiSc5pV329
         V4QPrnE9NwHJtkJGZlmJVQyDOxtVRNPF0VaolsiBvhmx0vyYAV2xg49jEei9IyugNRCs
         ximmwkUqnb4ZIXaGzjzsfLM2R33kCUFnnrzW8QVwvTMtjAukR/B1HwMgXi2vaZaNfkHl
         OBYocg6ywJCtvZAiNLflwATvlK9GoScZYWptlSCgk0CcE4qJwz5fc8mG9w2oK8lR3ix1
         zBMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzluKbXMeyuJXwlYxzaBkttmPH5erZg9TLnLpwezY9RWsjZnXagcQIW1nJVz3eBUEeJf7f9rIGyaD5fiBOq@vger.kernel.org
X-Gm-Message-State: AFq9FYJiSdvJEzivhdVA/sPzc//ifb/Jkvmdi/Ti2mKb+o4Imcc2yPAS
	+VP2ri1Zfm9clUQN5DghK4ASo6/LJVgDjVKka57rc3KDOgld2FIlojJaLfGBGLZW27JKRRu5w1x
	m82Qyj+0oOoapRj4fanVrOdYG5umAIae1839u/8JkjitKzcMV6ECh3wJVXTF5w0AUpfhq
X-Gm-Gg: AYBFou0lyRw2FpRiKOGz/rgaEeaaU/97qhlmn/Q99bXb4EahqJbPW83/Wvoxg8LAqU3
	conD+608RVbNn+S0K0MO15dGdqoGjmFuPCPdSQFDzCLZVcCezc71/35cDunBoVORAV218ma00Wt
	TeuB4KApiRTEPQMEwBkd2cbs3smquaM3LWLIfR1+OQOfyLDAEMROKxsMTmrDU7F0BYS6VkRlzyL
	M9ROu3UrUx7A0EuKrU08W7jlAWMsWxM92a1Ac2HsSuLkOG9FKEUAY3IaGZHl1GVmgj98eyhzgE7
	pdqJhfWPh79h37b8JQSWEbQOmjYB+LXUvnPBErLiP/oA5gUs9ot1ShJ99vqP3NINSCl33N5XqmJ
	IbYbEa1nPGyPMwDRGHPSdg/a9MFz60t0mtM4hRtI1/EZ0B+nxg724wTRph7A0XvLT056O0cIbcQ
	qCkK5LjGBQgRb5
X-Received: by 2002:a05:620a:1a1a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93ebd22932dmr2719653485a.47.1791999082265;
        Wed, 14 Oct 2026 10:31:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93ebd22932dmr2719640685a.47.1791999081425;
        Wed, 14 Oct 2026 10:31:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93de0sm789552e87.67.2026.10.14.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:31:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 20:31:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
Message-ID: <ussxpger36nwnvuqv4nmtogxkrn4krogw254qbtusdf7y2ofn4@pswnav4mz6lm>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
 <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
 <6c9937a6-88c3-4e5f-85a3-73d929d3ba01@oss.qualcomm.com>
 <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
 <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX7dyGpLak5scs
 kg2KRwQoJz1SRQ89SFL6bCnCn2ws3feiJ/5oG7s5Hos4lU+tsRzv7rhcWHyk23C0h3ribq2mGda
 42H1XmGpIuhJtCVfbzsEgeHkBeLEwkwDWHtQhX64raI8jGJrTi5BAzSUp6PSfhhODZa/NJcRYoq
 rXfz1WNgmdIjioSD5m3KlMn6ifcH49TIdoi4a9KDm9+HSBq5kbA/9saDRczKr9IbEtANFPUphhS
 BbqFVUNvoiEItHWxsv5rTkAloqNeLwJgO0VOguuDZPu0G+B5rpQCFNbZHunvcMlM6lMbS+D7/xw
 uf09LWxE0EmQ9GWEAAce+4+a4QUkUzm4tpoEBJ3w3s9p8z0IU6dv6qH8S/wxbXtlWAvJ/UvFFG8
 0mlna/dv70HeXpWVqpaKtr34ykwF21kJDV7D0Y9SKcxAgTpoNKhXyTqLnTJvW9TTK0lN9pyY/Py
 8VlsC93HGU7gJo/oUcw==
X-Proofpoint-GUID: kJJtq4HGsjdwqn2SlKq9yvdSgBgW5KBe
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfbc6b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qblbxwZfGeKRjrM4MhMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kJJtq4HGsjdwqn2SlKq9yvdSgBgW5KBe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfXyLcL/66GzPM4
 EXMKfEb/Fz90yKhUWd1bPSEfy6Mc33acGB4BlMheMbULl3UVYKdR+SuxIe1hd5UrVfVvjOV7+hK
 2Efu/CuPp5OLxtabgOafNjqg01CD6Wc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140069

On Wed, Oct 14, 2026 at 06:45:46PM +0200, Konrad Dybcio wrote:
> On 10/14/26 6:30 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 05:26:00PM +0200, Konrad Dybcio wrote:
> >> On 10/14/26 4:36 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Clocks on Qualcomm SoCs need a minimum power rail performance state to
> >>>> operate at a given frequency. We currently leave this to clock
> >>>> consumers, so a driver has to know which power domains supply both the
> >>>> clock and its parents. This ties knowledge of the clock tree to
> >>>> individual consumers and doesn't protect other users that prepare or
> >>>> change the same clock without making those power requests.
> >>>
> >>> Why would they prepare or change the same clock without making power
> >>> requests? If it's a legitimate user of the clock, it should have an OPP
> >>> table. If it's not, it should have a separate API to set the clock via a
> >>> legitimate user / aggregator.
> >>
> >> That's the entire problem that motivated this series. The consumer
> >> doesn't know what it needs on Qualcomm platforms. The power
> >> requirements are that of the clock controller's, not of that device's.
> > 
> > I'd still say that the consumers know that they need a certain
> > frequency, which demands a certain voltage / power / etc.
> 
> Right, but the meaningful difference here is that the consumers
> only know they need a certain frequency. The required power votes
> from that don't stem from the consumer's requirements. They stem
> from the clock controller's inner workings that are necessary to
> fulfill the consumer's demand.

Doesn't Iris core also have "we need this power to work on this
frequency" kind of requirements? My assumption has always been that
those are just folded into the clock requrements.

> 
> [...]
> 
> >> The Qualcomm case is easy - RPMH is *always* reachable, so the
> >> pmdomain provider needs no clocks itself. For the other cases,
> >> "patches welcome".
> > 
> > Ok. There is a promise that I2C PMICs will never ever be involved in the
> > clock / power tables.
> 
> Or at least that someone who needs them will contribute a
> solution to this problem.

I meant actual I2C PMICs, like PM8008.

> 
> > 
> >>
> >> [...]
> >>
> >>>> +static unsigned int
> >>>> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
> >>>> +{
> >>>> +	struct qcom_clk_dvfs_vote *vote;
> >>>> +	unsigned int level = 0;
> >>>> +
> >>>> +	list_for_each_entry(vote, &rail_voter->votes, node)
> >>>> +		level = max(level, vote->level);
> >>>> +
> >>>> +	return max(level, rail_voter->safety_floor_level);
> >>>
> >>> I guess you want to avoid having too many voters, but would it be
> >>> possible to have one voter per 'signficant' clock and let GenPD itself
> >>> aggregate all the votes?
> >>
> >> What does "significant" mean here?
> > 
> > I'd define it as "using a different power domain or requiring a
> > different corner".
> 
> I still don't get it

When the consumer votes for a frequency A / domain BX / level cc, usually
the parent clock (at the corresponding frquency nA) also has domain BX
and level cc. Sometimes (like in the case of PLLs) it's not the case.
The domain might change or the level might change. In those cases that
clock must have an explicit voting (I'd still prefer OPP).

-- 
With best wishes
Dmitry
