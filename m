Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD1B23AB88
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940354; cv=none; b=KvebzvT9t9H+iuBHCjfm6di3X2kzosDiahlvJP0BiH2jw7zhedQsYtR9nvxByqKHXaMLuPzPWhb1a9o5yghHLnjxlirtm80d/Ic2C2E+naYJX29BUaHS7TGVAmd+jGuhv9tMzq/cqtlkIWu80itV5/1biUq78RPDATQJRa+H6kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940354; c=relaxed/simple;
	bh=AGuF/BAKx4au5n9E6hgEnkxRW2YU+6PBvRqaK+PUX44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGjn8Tp3Kij4x3lS+48YW07Qf19/sukVXtZANkhtaR5wUMX57uBuXUrpE4WlZOGPngJ8dB9jeYGQhDNKUsOntLnmelqQD7Q/TuXsfDepcDzehAqFNzpyyYhNNvMHaPg3uOBYGoYxcHt4vUQxP8BPIE9ZQ+kKh4Unj7IEu28+gHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuQtqyDo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2rJTjSC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuQtqyDo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2rJTjSC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHuqq81125180
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v8uHs24TbGv5aVedl8x0SuPj
	hTPMtEGP5BA8dVaGj2E=; b=MuQtqyDovSrdx06tFzr7ylmbcxy6k8u+EJ7R28bA
	MMu6RA3PDQ8NinlmQnGmtwXvs5YGo3ICVxStwEtzpVZcr4rXwkzO9NbxeHBGCPy5
	JOwhKB5h8qTm64qd3MrKoc9T965MhzrL7ecumZXnqYiLPYk3gpMCrq4nqkJtwMkK
	jVGSOzVoWYHsEyZKbCJ5Id26E/U35HDzWgVzaT/t67FKkg2+09sfd08MOsgrmj2F
	ETroNIbfunBYMS2XuJYMRrOreEQgEnLgfNDjKslrkGeuvvQGt2vk4s1cYwv+7mCH
	ZiNQB2sY9O5bG0a4QEqotIDoRzJh4enUn8l4ctkVziJvcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg81hxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:12:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8067974so887298985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791940350; x=1792545150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v8uHs24TbGv5aVedl8x0SuPjhTPMtEGP5BA8dVaGj2E=;
        b=W2rJTjSC/ud+uh3PtsFyVVc0kYEUjKEVdec27YVCTgT+nyjwu36QqefTfwCW9IWBPC
         Ha3b3p8GCuWQSjRao5YN+yyaKxgl0o14cqGLXcDob61/bGTUurn255kuaZauChCmyGkg
         zd2wy5iYTUKZgYdA4ya2rlcSk3H1vrOc1sD6ucCyhj411o7tW1SJ2vcN9r4sSxq6fVx3
         vAXdrvc7Vt+B4PtffoRDzpfPz8avzf3Wz26br/q1rgEtqVM0M/rPpMEmFOy4ajGxCEuw
         FV07av0Av2b9V7VEfVvlK7RZWZ+g3kn4TxwYaoIS8CXup0Fq1rlhJQgc5x97Nnv6Y9GI
         bZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791940350; x=1792545150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8uHs24TbGv5aVedl8x0SuPjhTPMtEGP5BA8dVaGj2E=;
        b=qfzSV2puM/Xx4541WLJpQ6IXOcCUYym3X0Vj1es2J1x1D9XVcPapjJ1RMh7UvODisQ
         D0TGhEMT89lJ1XlosFpT0tBy+X7yr/0CNkzpLMhrzg2YDmqZQb0v80Ltmu+9cGcZZPdN
         XUmEBm/ooE4COy8NoGN8mnQNBG8nZhvacfW83BgmN6E9nqdQ6R/XfOrKrF+ofNcLyPbT
         nCkc2/BymOdwQu1rEAZVXUTJAGOUnSdOKAUekwvcBDy8HzZiQHeJTIE7z6AO1uEnA1lK
         P3/q9wJYbVXYpy/DPziz922/19dI15r6v9khPyHiq7I7k8wFFL/mUR0GnJ7wU9atCalq
         0nnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFSfhOeXi4RVFi9xIvUgpun6JRJ61ZngmMyxcC3Z6WEeSkuq7MPMeXtdkIaDlbarOhfaA8kp/10Jz/swNv@vger.kernel.org
X-Gm-Message-State: AFq9FYKYdHRcmTYFjMqRkFARG2EuH9n4UJ6qVWGd05NZE0CxpXFemq7W
	rifzMLvP/KH3QBwSrC7uS71nhwcCZGM+axHM53OwYGBN5uq51nw7HE7GzK3FAxyvlWkvLStgJ6E
	zueZ3E+vltU5Rx/RON3MVXgjQE6EXPpnynH0s3sf2iUfFpVxbabwSy3Uwtx98QlS7YRqx
X-Gm-Gg: AYBFou0QzSzahqlO2vboOU0bsBoDl3v+CyL5gan50rc3yCEYfgsOliSyAcLRLPSc5cp
	W0NyrCJ0LZ6/7aoxYXEmdTQYEJUAAIEVYR8xAbw1e1eJ6c1sftNShXr/xv/XNV/4TPUF2CginFB
	Fmwa9QSlSkrcaoqBVO+Hj++f3Tn39YAMjLReWubICgVkqJnefGkmZsQRm2ylZL4SuEihnEBXl0v
	TIvCOaV4fGic+htiEgt4v1gGral4BB5iSxPlsHJ7ikcQ/xvmPKunELKNu0mv03dTc3KnNDihgo9
	vYMvGWqWeUOo6upSsabjx6e3X51SwUB81JD5857J10gXrIeJxcpepNMBwnqLgLo9mgyO32vSCNv
	CjY2Paeb2WI2D1o7ImQuFNKE9o7nKOLzoqnVhzzkv6PH45AB9PDZ/+XzH7dHIzoNhgWopscsUkZ
	+9hGfFy7oCBDhg
X-Received: by 2002:a05:620a:44c1:b0:93e:9927:fd34 with SMTP id af79cd13be357-93ebd2244camr2230157785a.28.1791940350444;
        Tue, 13 Oct 2026 18:12:30 -0700 (PDT)
X-Received: by 2002:a05:620a:44c1:b0:93e:9927:fd34 with SMTP id af79cd13be357-93ebd2244camr2230153385a.28.1791940349858;
        Tue, 13 Oct 2026 18:12:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d9041bsm271555e87.60.2026.10.13.18.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 18:12:28 -0700 (PDT)
Date: Wed, 14 Oct 2026 04:12:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Skip read requests on
 unsupported platforms
Message-ID: <bv3dtgkfsoy2rui6iph2n4aua3y3r4gsbupls3sdj5frallxpm@hbhbbxxhvldu>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com>
 <53ea0718-285e-4e81-8f95-76e9b0c0f6af@oss.qualcomm.com>
 <5v37ztg44tvvwnofjssb6jpgxuwftjkr4mtk7g6oan2jggc4om@q7s475cmh2ui>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5v37ztg44tvvwnofjssb6jpgxuwftjkr4mtk7g6oan2jggc4om@q7s475cmh2ui>
X-Proofpoint-GUID: _qlMmAirHoZ6cxvgp_RnAMlfzHMOGBk1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfXzGOcvH9FmalM
 Y/xJMCUOl9Y35yO8RvgjHgzfyT7VGp3H7MowWbtL2zQaja0n4wUPxWUZLvicD+sB2g30SuzXD0A
 uHmStsbm8+DAAI77wY8aJfUEVJYT3RA=
X-Proofpoint-ORIG-GUID: _qlMmAirHoZ6cxvgp_RnAMlfzHMOGBk1
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6aced6ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eYbMM4FVXoET8UIPlJwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfXyWeMp5fkYikb
 CA0jne6Tm1DeZ9/MzA+GkNWnYYKq80qJoTaNmpyUbmu3kEkwliqYdDbnW8ekSCpx8e+62EsRIz5
 4o+yHrfybtfRymG5AvIBS4+9GFlH72ZhXxKo88NP4abWUx9qSKb0QTEkuuNSJavgWUrjNTZJagH
 Vg9P7TGkSh+lQNldIvrIWP9AF+0l103sYT4WlaE1xZboPmOxJNIgte3Ah1/0WN4xsPeAbERmtdL
 4K4Ox/nioaoIWRMm8t8LjKwyigwNLp2rq3TAFK5Beg97QXvoK/FjskanY+RDXNOdMgONNIHg0an
 J/Iuq5Z+VSfs8iE85bdwWeVLslSlKwItwg+M8Igw3uqbNaKmvycwJswfmhuVXVq77MuP/45u2xk
 4H8kEoHS5X0d2v45/A01WCl+jbX4OXfFcrvUsay4An21aEMK83e5GYWEdycbdNnQPkuR2oHv0at
 4LKjTNtC+fONgfN9VhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140004

On Tue, Oct 13, 2026 at 10:35:06PM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 21, 2026 at 04:29:43PM +0200, Konrad Dybcio wrote:
> > On 9/11/26 11:08 AM, Maulik Shah wrote:
> > > On some platforms AOSS do not respond to read requests. Read request in
> > > such cases will consume the ACTIVE TCS but forever waits for a response
> > > blocking the subsequent write requests.
> > > 
> > > Skip issuing read commands on sm8150 and sc8180x platforms. For such
> > > platforms return success to the caller with the resource level at zero
> > > to avoid the caller taking any action on error code.
> > > 
> > > Fixes: edbafe65eef2 ("soc: qcom: rpmh: Add support to read back resource settings")
> > > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > > ---
> > 
> > This works as an immediate fix, but I'd like to get some
> > comment on this:
> > 
> > https://lore.kernel.org/all/3058d570-aeb9-4f73-831c-c30626296006@oss.qualcomm.com/
> 
> Maulik, any updates? SM8150 is still broken. Should we just revert the
> commit?

After some debugging, on SM8150 reading XOB regulators times out (at
least it applies to ldoc1).  I assume that SC8180X has some kind of a
firmware fix. As far as I can see, reading SMPS or BOB regulators always
produces 0.  Reading LDOs seems to work (except for the XOBs on SM8150).
I think I have a workaround.

> 
> > [...]
> > 
> > >  	DECLARE_COMPLETION_ONSTACK(compl);
> > >  	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
> > > +	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
> > >  	int ret;
> > >  
> > >  	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > +	if (ctrlr->no_rpmh_read) {
> > > +		cmd[0].data = 0;
> > > +		return 0;
> > > +	}
> > 
> > This should be -EOPNOTSUPP and consumers should handle it
> > appropriately

-- 
With best wishes
Dmitry
