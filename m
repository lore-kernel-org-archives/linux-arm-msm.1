Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C972D0617
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 05:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791435937; cv=pass; b=pnnYSOOPEumRYB4Tdopz7F6qw2F2v4sUt2u3jltL9n+vTZGivEeQpUbBwmXfMxopVH/ZAjzetzPDknXAvarIBNjquXaaeveFn0nMV3j1OG3uKbCZWyP+uppIxEQYdJHZZ8tvVAY5KlLvz6JX34yfmwb7+uvd8ItRrkce1FTQsUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791435937; c=relaxed/simple;
	bh=FgXnQG+CnfNFToW7GlIT/9ZQnBMRUHu0Btw+ksUjej0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZ6HrlknBLF+aT0hMvcMgk7r/mZ9OlBc4VtQMK79O4NWZVx3dh1RxAjOUk2T4ISaXrZ6MfvQhrv3q9TwlXpjd7Dq0Nt+k3dPbRFMk9fnRkDClA4+Pf+SbJ0M+PH5S2YBbw5clXxGTFwI+Cx4fu48+j472TwhD1cp2EkhpvkSiQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSVN6W3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7SkxxUd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSVN6W3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7SkxxUd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984Bf1t1776038
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 05:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=; b=bSVN6W3xVa3Sz4qX
	c3SSDNvSwbExIIJAp3kqhcBF9Cgit24uSAyrZVjVhQUihmjoCXse6f7fgNqsCqOr
	Vdsm2XIvw9TQ1IM/ulMvk21CA2o1x1B1Lkuz0/Iy/iay8LI2WzVdSyUJjMucuqUN
	5zmMQq40di2qTgMPvBMPpmWFL2pXi17nmjLioNS+eNsezstjl4JYBDx9+Ab4DhSn
	8XfG+nGn2AclO6juaFAqupxRYhJROqSMKfcj1hSL2O849rw0+MjUrlZUcjVy14sP
	nOV43rUTDd5gTcVdlwheSxDeyjcsriQyeVD0Woi946OBryiJnRFKkkY5XIEqkXmS
	fXAROw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe394x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 05:05:35 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677c4ca2265so9412626d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 22:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791435932; cv=none;
        d=google.com; s=arc-20260327;
        b=HoXdBrNlW9tvLUmqzErFJnKRgZLeYNPU9lagN+QnCRfzyRP50+rDR00Ht54pOrLGH4
         NSSvT8uIMwI5avAWqq402TnLGStLOnmUZjzyc05+86slbOc2Jd5uoAebcIdUwxufTL0B
         gDuHgkEukP/BYQIMM0KDKbJ2ggvy6BfJ9zC0tar2VmZuofliXynjdKsQB3GND1b8CNYH
         QwxIYFTaxO+vVCIU9YLnuIk98TXuCWCtHnFelElSdYcA9MfWcTdRztLwH6/d8SfPO2eC
         93MqldFdyWzPzDFizbKGgC2JUSMP5z7UAuCndyAmhUud/gAEURDCbDgh33IXj7vF/xV9
         ozag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
        fh=mFhIQpr8HH6V+aCncP1xAMtICIAb5lUsXxFV+XFzm1g=;
        b=pghYTg6rWS+9GEZOEhZAfhsV6MK/cZt5BkaVvFIm5l6/2avod4vDy6LHKZwbcB8eRp
         hxjtLpko/JtSiy7gWeieOzTKr6QRUJwr2XR5HRQCITnOeSfE+1YzCM+xrXC3FdWUqiX5
         ywNQS9MbF3LE10ntGaW23nhIbXO+UF57QoXKC5HaSW3rReLrSEneEMeLwRgptOysDjAO
         WHg1BGFiB8fO3SeGZ9TOFg8dqgU7PQyrMW7g/xccDzYHUcmMSNFaGecYypQudrkWrd4E
         8lZvPct3ZAv876bPM8LrhjAMjA4S7yitRkKlQYez8uXqsarknLepQJFXEYJDf8qCgAPG
         NeMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791435932; x=1792040732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
        b=K7SkxxUdOu6UfswM+ujS1jGUVGZTdqVyi3ElYDnEjWzWyJd0qNgoHlTfUicJgLlIp0
         pqw7ltk+7eP7BiP0+gF9XxtrugBtv8xPwWG5FEAmlejkmHFCT4h2g7n6yE3z3JzXkTK1
         ywQyT4keFuqZj4WLzFTd+Z6va/Wczwn6tZzyE6+DVP5IveiciA+15G3yvm9lOH251PoT
         kKSnMFJL8VrIM/oEVBnD2OQcuJiQfkgNdThHEUhwQYjzZ+e+nsa0NHgfOHxLp6GVW0P/
         y4RoquBURC0tII1hpXGRM1QG5nEyPAy3ddTlMfo81Bk+K6xZ6jCLHaFxYT0EtrLU7+kq
         6CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791435932; x=1792040732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
        b=aExCZ3o4tfDWItpcayvK0ktlyiaj+OtlSKRdxY/yyCso0StMuvB9+BD2nWVljVEn3E
         8ZjVM/Jye9b7ym9fVZ5J/tkAiD/mB0HiR2f0L7AaxAjjvakfHea2CuR4RVKn3sRVGRKP
         7rgyPef8ijrN/cHSVUGbTb8t6espe4Gh14IgYvU51ihDepaxKaTr2eti92kUCszMBXgo
         JBQUc70juo6LtB+DSUxtm9YWz8qqRPv4zTQ5F6oS2FgERu4XJWdF6W8cZY1rnGqafuGM
         6Zr6+KNkaZxS2+QaPmuJijT+cZwotYL8UHVvMKls6gzlndhiqWqaw5miV1DtlT7opStv
         jCZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpXD8A2cU6PsN5FszAOsSuoZONki46X5TIYEKzEm7mPY/z0K44BzDBpLZD4TcKTyI5xROxkhg+l4Bwffq5@vger.kernel.org
X-Gm-Message-State: AFq9FYJgQuVeu6zUZbA/WGQuzbI2aBpQC/lyhes/OBMp2O9FEOS3gllT
	ZvRrslUtZhCvwDQxMW4hed1e/Xuk3TFKsle81RRG3In4juMy43eIlKvyrKtBabsh8pZJ6TrUU8o
	fsI0/lRwSsuOyrTEDzR+ynSbarWrN+bFU2BwOP6z6tK+b4V0fvzSvfboYfud6cCDKR2ks5XaEOD
	K56Hv9MKKzpITYoP6rl1bads/J3nQbITqxnTCXgPKD1ss=
X-Gm-Gg: AYBFou37WWoWynrq1dpCrbAKFUSRZkjsEKlsBw0IX2GFJUsLnWSahLSyANKAVNLD2jq
	QVpsadhqgKAQoCXolShMdu7+CbnKcbDVFkUUiLns8Hc2sMjnHE/ZKwfUwYfrN5eSZ6jmMmyENhi
	tSjafsYGc8Pc7ofsrZ/HrfoTNT4Nm2RwwaywlAM5G8AnPaPHVcsdmiU47sNw==
X-Received: by 2002:a05:690e:bc1:b0:675:37b1:931a with SMTP id 956f58d0204a3-6790a0c3183mr2138143d50.12.1791435931753;
        Wed, 07 Oct 2026 22:05:31 -0700 (PDT)
X-Received: by 2002:a05:690e:bc1:b0:675:37b1:931a with SMTP id
 956f58d0204a3-6790a0c3183mr2138134d50.12.1791435931363; Wed, 07 Oct 2026
 22:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922130653.357615-1-andersson@kernel.org> <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
In-Reply-To: <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 10:35:20 +0530
X-Gm-Features: AclHuK8ljan6yYkSfeVW4C8TVoEvGkyXaktUQeB7YpkfdtcH9wriLsHpMlMeAII
Message-ID: <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <andersson@kernel.org>, arm <arm@kernel.org>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac7249f cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=9s7x0yUzlkJ0pj1vzNoA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMCBTYWx0ZWRfX2+qHiz1ViW2I
 62L2aka7lZKVU/LxsAlKQ7jbVp6s66A1LsI7uDZoqEhOwlxzL16cVaj1iNdatz/OIDtrW+zeI0i
 jyJGRhUgMw44dukSz2+DQrFxT7w5a/A=
X-Proofpoint-GUID: 8cfAmaE6AlUJ68pVB6ADyP76lkaLB759
X-Proofpoint-ORIG-GUID: 8cfAmaE6AlUJ68pVB6ADyP76lkaLB759
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMCBTYWx0ZWRfXxD8ELT8uVSwk
 WYnKjAvUyrioXt7ODo2fBSEgGn5Lm7rW4WC102t01ppUj0RtNf5xLyWgl3b9Xr+1jofghK9Bywi
 YM17tmr1sZKilZ8G770NcoJOskuajhMO9js9agi3YmW3ai9R6fUxlMklzOZmuKzYuZ6mAsiorEV
 TIwLJ3lGm7N7A5GFcBsMB+PLtZu0EEbueA57Lnwtp3rnOe3njVNMXpoS1TtdermMd/dbivgVY4z
 EAeS0mjzg+sl7n2apG4pvIKeI9gK3z6TJ7S1afRt84dXjm0zfqIhkMfzLb2io+yr242+sVrPhhz
 MtZBODTEeuQFgwlbwiD6EEhPtviJbItbnMtQfSVzQ6oEYWnoGxc3QA6Wi2Yy4LYt64Ct1diynki
 1FCK02C5EjQem86ZZF/ZYEhzXvK4uxFnXiPJzu9drOhXqP7yBX5ZvCBnjbqF9LxM3kc1OdNsw2T
 gCjcAEQpp1O1dnj6Myw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080020

Hi Arnd,

Coming back to work today after vacation.

On Sat, Oct 3, 2026 at 3:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> > The following changes since commit cee9395acd8043be0644b25c34bfa86623f2=
b935:
> > ----------------------------------------------------------------
> > Qualcomm driver fixes for v7.3
> >
> > All clients was migrated from the Qualcomm SCM PAS API to the Qualcomm
> > PAS API in v7.3, remove the now unused direct API.
> >
> > ----------------------------------------------------------------
> > Sumit Garg (1):
> >       firmware: qcom_scm: Remove SCM PAS wrappers
>
> Hi Bjorn and Sumit,
>
> I was running a little behind on the fixes merges, sorry about that.
>
> As it's getting a little late for 7.3, I would suggest skipping this
> one patch as it is a bit large and is a cleanup rather than a fix.
>
> I would instead merge this directly for 7.4 but still take the other
> ones for 7.3. Let me know if there is some reason I missed why this
> needs to be in 7.3 after all.

I agree it's pretty late for v7.3. I am fine for v7.4 if Bjorn is able
to keep the dependencies sorted.

-Sumit
