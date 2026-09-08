Received: from sonic312-23.consmr.mail.ne1.yahoo.com (sonic312-23.consmr.mail.ne1.yahoo.com [66.163.191.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF39B52B1D6
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868348; cv=none; b=ZA8o860R6gPLOGkUJm0Ro64cjJcHxF4f4yGtx1SX4/xAdqC0ex6Rw+CEYJWzCBrnt3w2uIgA/WeKOpt4VdACBDfLF5DVEGlMSAkYk5ytG8ahyCepD0EulbqiEHAwWRtYUvIoOLaNOQ9PgSd1YD7EITyWYNo0wh2+jGEye/48oCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868348; c=relaxed/simple;
	bh=LjH1faTnVVN5uMetA4uwbCmCsTumX7kxFH0HtObW7RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaCI6LR+E8YcU6Zkx3ShrEtR9FaNa8W0F3PadA2WU4hpC/lMDjynLpmybfnBEhDxjbnpYtD8BZwfuDwqzsp0BiQr3BA75SU4Zu4whD8pK885RZ0RZr2YAw6XKxPKK8kahBqxy9Nlx21omlJHdTnf2S4JTfFLOBkEsRKvjHAb39I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=ngLsa98S; arc=none smtp.client-ip=66.163.191.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="ngLsa98S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788868341; bh=YRUBlZ8dLqp9JSfEYU3LqyguQG5ZgeUgfnh64Fsjygs=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ngLsa98S9ohzjHFjVXlP3Pw5OqigOrqV2M/2EnqBQo2Lod7lFLwR2s/tbGwRil3jAQy4zJDBggqTM82E0UhsFTLHfXff+G/retxgSdagoNm266qep0g4WwZoOq/QmaVs9rBaqJ6XjBna7AjdAsGDa31PTW8XqTC04dqym3D15hP8tA+FZCPSXsQjmT6p+FbT3HvTBEVpYcKL2ZxSf0ukS+WQ/WrB0usrVw/GDTyZ9FKXHrzw35nuPg2zBaipiUhlhnb3TUJHg6TdnL5Ld9qbODyzpx585obxk+P5uKbWFh/lO/61y2Oqhudw3XUcpCTOB5pjcSemke+kcFTVl5o3vQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788868341; bh=bysn2EbP3zzWXXCmQOeOa6DkW9JhwrOUg2IxwdYRbtR=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=iynNPbwbWEeCh9i5PoClhiM9SYwPPrtFJWCxXpQLcz6rV0wBYKm25TsZwDMNfpARv7RC9y/bnd06bTCxjmXPGWnDYRLnkvkvNs7MmvOAWZIoGd5HLALhQsjcD7g+nM0WJZrJiQMLq8weUe2QdJ0xHBW5fpf6fZCeGqk+6TK0LxI+V6sjKyxIAPpeexNv6dQWQlGQAh5hyylrZNoFgMvOeDgnzawBQ6kuLaVm9yAsrl/0tkBk/ocyfT75qBbrh6EkR/fkJQ+8Ox8CwqbcF3V340GqJNo2v7waanJe2vw+bzaM/g5vVFVIdof1TDR4ql03PwzmIw25ZQfq8HtA2r9nsg==
X-YMail-OSG: gmPyFQoVM1kc06WG4qbxndFv7A0iv9Zvs3kCG56zD6fXv0_RPErM.KJ2_Y03wTK
 P2DhEW7IyNdWPB1oZZUSd30nh9bY18etlCM7_76lo4eQPD8pRW5GjFvkb43LVq5L9xej2o7xEFuW
 GEJfkZ9aSs8Ze_o3MZXQ3oiGd9K6q7WrFgqp8HdYS8ka2aPZhu9Zhu.l8SCSETpSuI_GwXLa4sel
 Hc932i4trMUWVfSNlsIjRqNgiJ6k71EiWKqRMh5jR.1lilDP4hK00_t_rgl7wHlY3r98SjxxpfwY
 Z_yTwWje_ia9mdz11bFrFPlDWVoomvIF0c80uMZTlytwRcgKQIX9u1H0k.bI3SLPL1Y1L6mvRM8y
 7BT16SikZrVBBTOZSehD6E4AIRN6NfpSIhDHq24VgqJtEr7nhQxIqJjmDekQb0pbOHu8HquYI.8O
 eoAv3HW8HuHBSSlc7n2xrUbZY1d05D1lOmaJfTNzr3eqUHt00Fcuq47BsgwVZgn.riCUy4oHxvU9
 6EKJAnfT0Jggz2tW7wSZb167xC9ENpm0xe72ti3bfMEqcj7rekZHcsHN3Jo9M15f5dyq5Fv3Lvx5
 fNbNLjN0OTAvmO2j3yx1lB1R7d.BrM3m7Jp4I42SFt.H_8JkCBGP7vk_MXPSma72HOWbMb2w8TAH
 Z0xKYGUK9iNFY6422ZnUCERqA8PpFjpgj53A1KZ5t_zBw_6yF3tTbMYP1GtX122zluBJBuRBiYxm
 kFzpCl5drZcwBBrHFb9nkOr20KJv105U2HKaGzGVVEjsF3Qp.l8VbHdxACFzNk4n7Ei0exRs97S7
 hKLUywdg__q0dy3xOF9geMZwOn.PdntHq2dRweZ_vA3XH1FhpXD_qnVXAy3imyiX4v8D_QhUa9Vs
 JmwhrOeCAzS5joDHI0ZbJOzaOQsz617LirTFoWCdJYZWMaCMCXAKXzRpqLHvYvBrxL04g0ib9NU8
 AVMbAkttrVustmuJjLpDX3b0627711vkp0s_KRb5Q3vJW1GMNPYl9ls8YilSTeAZVlB5i_sny3Uo
 RNNbzC_jfjwcPdhjMo.j7ffSnXG0rI1zqgNPZ1AJHyU6Tg16Hf9Z4IR0m6T1irvaUG..TlnOFvkZ
 XkVpajROJxhPGUPaEemA5paAzCfrPUPrzmmgo4zAn631YjykEMjibnOBFqfTQ9_xm5wnA2FbvKVn
 AtCmAGmyV0KExIcv28plPUwH6OkeJG.oxIK2S6n5pMHD5g6ZGWzdYkYt9TyhrnD1KCV0c0UOtiDR
 qFsjLTFDAfqZgzEzDOHh8Ev9L06Kd8XDanoUqHsT1WQuQfbMAo68yLRUrT_IHQTbrDMj8mUp.rBz
 oc4V8jP6AlsMWNmjBUu.wPgIWB.whZ0O0yJ_0rn2ALs_IICsK_twRzlZspNETtapVUhv13kZSiwO
 tuPptpvjkGSHKLGkrdHiFi_ftp3TH9NU0PKabUa8FsHj0u3amhnh2LFyw0BWz937Efd2xoRsm._t
 Xp71I.OaC2y_nGRNuRng0kUgU5a9kWZnXdOXj9klDGAf6mb81d1fnnq_kE6T24HTjyjukjDdhFHf
 34ZzZb4ZPENmfrXtc6w9hVA4bL_WDWxDEynJFaQnJxsgCV0VVHGl4pCJb0JdGH79JH0XWoRN8q7.
 hY_8ClVK.xU1wbwdNEA3LiRlIXpTmM9PeaGScduhnqJSgaPU8XT0bNjQ7UhYQqCk39WDWwitK9bl
 l4QG1VCdv6G0BCk1v9JQdayL69rN02EX8DColnqBHh5xA_dLyqQEc3MkDMEjLLr7VmUAeMC8lb6V
 _euX37AQEbeLinN4OMz5v6SdK8p8lPQLgln12ezgahZQTVstRdtVwVQDCTF8rmxJMOrWwu_C8TId
 J1_Og3za0k4VKJaB2HGi0hdkifQ9.DiG3RtwFGYNfCpHX4aZ6tnXjOBX2.CVagHMW5pJ_HYMI_gX
 s.WSVbRBOOILhzoJM.bx0sdRJlchiadweeK2Rh7NR9HstKOlqc0gab4IuHa8Tgk62Nx7ULVrA2pj
 0mf0Zohdr5O1ngPpkdhyAs1DOjschcAoJu69OdFeX2VXok.kQSICNl3yJxSS06mNcV9d0XRnn0PB
 vJi87.4yCkaqBkGqNAnl7xV60IXjwEpdq4qyNlmoQexBx28vlR90idZvj5QlaRR2ZsFdFh.Fz8Br
 GSuQTtxRTzFjrdPWQGubTiBKCVio0UQlsxCBN8NIhZkBC33EvWRqzhIi.ccyJYO_1gB64i7TPYHo
 3_6rOZxWP0Nnj08CpC0uyxC.vLi5Av8mtXvDQ6SH.lgEqLDwumzsCWrV.uxkoBup8dr8zcgH8_7r
 0WL4eaSR.
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: a489773e-6412-4553-977e-0a5fc5d1ab86
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Tue, 8 Sep 2026 11:52:21 +0000
Received: by hermes--production-ir2-cddf86dcf-rk2hx (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0f3422411e7bf53728402e6080428f01;
          Tue, 08 Sep 2026 10:57:34 +0000 (UTC)
Message-ID: <11b0c7d4-4e77-42a8-9528-6dacafd3e251@yahoo.com>
Date: Tue, 8 Sep 2026 12:57:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Stanislaw Pal <kuncy7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Jie Luo <jie.luo@oss.qualcomm.com>, Georg Seema <georgseema@gmail.com>,
 Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260805193638.15327-1-kuncy7@gmail.com>
 <20260813093351.178419-1-kuncy7@gmail.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <20260813093351.178419-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26460 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi Stephen, Bjorn,

Just a quick ping regarding this series. The discussion between 
Stanislaw and Qualcomm (Jie Luo) has been fully settled in late August. 
It was proven that handling this on the UNIPHY side is not possible due 
to the early stage of the watchdog reset.

Are there any remaining concerns, or can this v4 be picked up for the 
next cycle?

Mieczyslaw Nalewaj<namiltd@yahoo.com>


